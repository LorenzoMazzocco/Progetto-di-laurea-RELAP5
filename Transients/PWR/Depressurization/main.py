import os
from iapws import IAPWS97 as XSteam
import numpy as np

#####################################################
#                                                   #
#                     VARIABILI                     #
#                                                   #
#####################################################

# TERMODINAMICA
p0 = 155.1     # [bar]
delta_p = 1.97 # [bar]
T0 = 566.25    # [°K]
p_atm = 3      # [bar]
toll = 0.1     # tolleranza per la fine della simulazione (distanza tra p_in e p_atm)


m0 = 0.335   # [kg/s]
m_eccs = 0.3 # [kg/s]

m0 = 0.335 # [kg/s]


t_active_core = 31536000 # [s] (1 anno) serve per la formula di Wigner-Way
delta_t0_scram = 100     # [s] delay di scram dall'inizio del transitorio
delta_t_scram = 0.5      # [s] tempo di esecuzione dello scram
P0 = 66351.88            # [W] potenza nominale rod

# INPUT RELAP
card_pressureinlet_100 = 1000202
card_pressureoutlet_100 = 2000202
card_power_100 = 20288802
card_m_in_100 = 1100202

card_m_eccs_100 = 3300202


# TRANSITORIO
lambdas = np.array([0.05, 0.1, 0.15, 0.2])
delta_trans = 30 # [s] durata transitorio dopo la stabilizzazione della pressione a p_atm


# ECCS
p_eccs = 20.





for l in lambdas:

    #####################################################
    #                   PRE-PROCESSING                  #
    #####################################################

    ######################### GENERO DATI  ########################

    # Creo t molto grande e seleziono solo la sezione con valori rilevanti per la simulazione
    t = np.linspace(100.5,10100, 20000)
    p_in = (p0-p_atm)*np.exp(-l*(t-100))+p_atm

    t = t[p_in-p_atm > toll]
    t_fin = t[-1]

    # Creo un nuovo spazio dei tempi imponendo il vincolo di 97 points
    t = np.linspace(100.0, t_fin, 98)
    p_in = (p0-p_atm)*np.exp(-l*(t-100))+p_atm


    # Trovo il vettore di temperature
    h0 = XSteam(T=T0, P=p0/10).h    #[kJ/kg]
    T_in = []

    for pi in p_in:
        T_in.append(XSteam(P=pi/10, h=h0).T)
    T_in = np.array(T_in)

    # Genero il vettore di pressioni in uscita
    p_out = p_in - delta_p

    # Genero il vettore di potenza
    t_power = np.linspace(100+delta_t0_scram+delta_t_scram, t_fin+delta_trans ,97)
    P_decay = 0.0622*P0*(((t_power-(100+delta_t0_scram))**(-0.2)) - ((t_active_core + t_power - (100+delta_t0_scram))**(-0.2))) # formula di Wigner-Way

    # Genero vettore mass flow rate primario
    m_in = m0*np.exp(-l*(t-100))

    # Trovo tempo di attivazione ECCS
    for i in range(len(p_in)):
        if p_in[i] < p_eccs:
            break

    t_eccs = t[i]


    ############### GENERO CODICE DA SOSTITUIRE IN RELAP INPUT #############

    # Inlet pressure
    add_pressureinlet = []
    cardno = card_pressureinlet_100-1

    for i in range(len(t)):
        cardno = cardno+1
        line = "{}  {:.1f}   {:.5e}   {:.2f} \n".format(cardno, t[i], p_in[i]*1e5, T_in[i])
        add_pressureinlet.append(line)


    # Outlet pressure
    add_pressureoutlet = []
    cardno = card_pressureoutlet_100-1

    for i in range(len(t)):
        cardno = cardno+1
        line = "{}  {:.1f}   {:.5e}   {:.2f} \n".format(cardno, t[i], p_out[i]*1e5, T0)
        add_pressureoutlet.append(line)

    # Power
    add_power = []
    add_power.append("{}    {:.1f}     {:.2f} \n".format(card_power_100, 100+delta_t0_scram, P0)) #aggiungo la prima line per il delay di delta_t_scram

    cardno = card_power_100
    for i in range(len(t_power)):
        cardno = cardno+1
        line = "{}    {:.1f}     {:.2f} \n".format(cardno, t_power[i], P_decay[i])
        add_power.append(line)


    # Mass flow rate primario
    add_m_in = []
    cardno = card_m_in_100-1

    for i in range(len(t)):
        cardno = cardno+1
        line = "{}  {:.1f}   {:.5e}  {} {}\n".format(cardno, t[i], m_in[i], 0., 0.)
        add_m_in.append(line)


    # Mass flow rate ECCS
    add_m_eccs = []
    cardno = card_m_eccs_100
    add_m_eccs.append("{}  {:.1f}  {:.5e}  {}  {}\n".format(card_m_eccs_100, t_eccs, 0., 0., 0.))
    add_m_eccs.append("{}  {:.1f}  {:.5e}  {}  {}\n".format(card_m_eccs_100+1, t_eccs+0.01, m_eccs, 0., 0.))


    #####################################################
    #                 MODIFICO L'INPUT                  #
    #####################################################

    os.system("mkdir lambda_{}".format(l))      # creo la cartella apposita
    os.system(r'copy "..\..\..\Steady State\Modelli\PWR\input.i" lambda_{}\input.i'.format(l))     # copio l'input

    r_file = open(r'lambda_{}\input.i'.format(l), 'r')
    r_lines = r_file.readlines()
    r_file.close()

    # TROVO LE LINES GIUSTE E AGGIUNGO LE TABELLE

    # Power
    for idx, line in enumerate(r_lines):
        if line.split()[0] == str(card_power_100):
            target_line = r_lines[idx]
            break
    line_power_100 = idx+1

    for i in range(len(add_power)):
        r_lines.insert(line_power_100, add_power[len(add_power)-1-i])

    # Outlet Pressure
    for idx, line in enumerate(r_lines):
        if line.split()[0] == str(card_pressureoutlet_100):
            target_line = r_lines[idx]
            break
    line_pressureoutlet_100 = idx+1

    for i in range(len(add_pressureoutlet)):
        r_lines.insert(line_pressureoutlet_100, add_pressureoutlet[len(add_pressureoutlet)-1-i])

    # Inlet Pressure
    for idx, line in enumerate(r_lines):
        if line.split()[0] == str(card_pressureinlet_100):
            target_line = r_lines[idx]
            break
    line_pressureinlet_100 = idx+1

    for i in range(len(add_pressureinlet)):
        r_lines.insert(line_pressureinlet_100, add_pressureinlet[len(add_pressureinlet)-1-i])

    # Mass flow rate primario
    for idx, line in enumerate(r_lines):
        if line.split()[0] == str(card_m_in_100):
            target_line = r_lines[idx]
            break
    line_m_in_100 = idx+1

    for i in range(len(add_m_in)):
        r_lines.insert(line_m_in_100, add_m_in[len(add_m_in)-1-i])

<<<<<<< HEAD
    # Mass flow rate ECCS
    for idx, line in enumerate(r_lines):
        if line.split()[0] == str(card_m_eccs_100):
            target_line = r_lines[idx]
            break
    line_m_eccs_100 = idx+1

    for i in range(len(add_m_eccs)):
        r_lines.insert(line_m_eccs_100, add_m_eccs[len(add_m_eccs)-1-i])


    # ALLUNGO LA SIMULAZIONE AGGIUNGENDO LA CARD 204
    r_lines.insert(38, "204     {}     1e-8   0.05   00003   10    10    1 \n".format(t_fin+delta_trans))


    # SCRIVO FILE
    w_file = open(r'lambda_{}\input.i'.format(l), 'w')
    w_file.writelines(r_lines)
    w_file.close()


    #####################################################
    #                    SIMULAZIONE                    #
    #####################################################

    ########### CREO STRUTTURA FOLDER ############
    # Pulisco
    os.system(r'mkdir lambda_{}\out'.format(l))
    while len(os.listdir(r'lambda_{}\out'.format(l))) != 0:
        os.system(r'del lambda_{}\out\output'.format(l))
        os.system(r'del lambda_{}\out\output_strip'.format(l))
        os.system(r'del lambda_{}\out\rstplt'.format(l))
        os.system(r'del lambda_{}\out\stripf'.format(l))
        os.system(r'del lambda_{}\out\data.csv'.format(l))
        os.system(r'del lambda_{}\out\screen_simulation'.format(l))
        os.system(r'del lambda_{}\out\screen_stripf'.format(l))

    # Lancio simulazione
    os.system(r"..\..\..\utils\execution\relap5.exe -i lambda_{}\input.i -o lambda_{}\out\output -r lambda_{}\out\rstplt -Z ..\..\..\utils\execution\tpfh2onew".format(l,l,l))

    # Pulisco file inutili e ordino
    os.system(r'del read_steam_comment.o')
    os.system(r'move screen lambda_{}\out\screen_simulation'.format(l))

    # Creo stripf tramite RELAP
    os.system(r"..\..\..\utils\execution\relap5.exe -i input_strip.i -o lambda_{}\out\output_strip -r lambda_{}\out\rstplt -s lambda_{}\out\stripf".format(l,l,l))
    os.system(r'move screen lambda_{}\out\screen_stripf'.format(l))

    # Estraggo i dati (creo data.csv)
    os.system(r"cd lambda_{} & py ..\..\..\..\utils\other\parser.py".format(l))

    # Elimino rstplt e output per alleggerire la cartella
    #os.system(r'del lambda_{}\out\output'.format(l))
    os.system(r'del lambda_{}\out\rstplt'.format(l))
