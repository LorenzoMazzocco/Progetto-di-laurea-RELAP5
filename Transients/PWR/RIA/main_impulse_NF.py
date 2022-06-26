import os
import numpy as np
import matplotlib.pyplot as plt

#####################################################
#                                                   #
#                     VARIABILI                     #
#                                                   #
#####################################################

t_fin = 135.0   # [s]

m_uo2 = 2.115   # [kg]
P0 = 66.35188   # [kW]

c_fuel = 235     # [J/g/K]  specific heat capacity fuel
beta = 0.0065    # []       delayed neutron fraction
l = 40e-6        # [s]      effective neutron lifetime
ftc = -3*1e-5    # [1/K]  fuel temperature coefficient

t_max = 0

reactivities = np.array([660, 665, 670])      # [pcm] reactivity inserted
reactivities = reactivities*1e-5

card_power_100 = 20288802







for r in reactivities:
    #####################################################
    #                   PRE-PROCESSING                  #
    #####################################################

    #####################################################
    #           MODELLO DI NORDHEIM-FUCHS               #
    #####################################################

    P_max = -m_uo2*(c_fuel*(r - beta)**2)/(2*l*ftc)  # [kW]

    # COSTRUISCO L'IMPULSO DETTAGLIATO
    a = 2
    n = 400
    t = np.linspace(-a,a, n)
    delta_t = 2*a/(n-1)
    P_impulso = P_max*(1/np.cosh((r-beta)*(t-t_max)/(2*l)))**2  # [kW]

    # DEFINISCO LA DURATA DELL'IMPULSO studiando la curva dettagliata
    delta_t = (sum(P_impulso>0.5e-2)-1)*delta_t   # [s] durata complessiva impulso

    # CREO INTERPOLAZIONE LINEARE CON n PUNTI da dare in input a relap
    n = 10
    tt = np.linspace(-delta_t/2, delta_t/2, n)
    P_impulso = P_max*(1/np.cosh((r-beta)*(tt-t_max)/(2*l)))**2  # [kW]

    # SPOSTO L'IMPULSO IN MODO CHE IL TRANSITORIO INIZI A 110s
    tt = 110 - tt[0] + tt
    P_impulso = (P_impulso + P0)*1000 # [W]

    add_power = []
    add_power.append("{}    {:.2f}     {:.2f} \n".format(card_power_100, 100.01, P0*1000)) #aggiungo la prima line per il delay di delta_t_scram
    cardno = card_power_100

    for i in range(len(tt)):
        cardno = cardno+1
        line = "{}    {:.4f}     {:.2f} \n".format(cardno, tt[i], P_impulso[i])
        add_power.append(line)

    # AGGIUNGO LA CARD FINALE INDICANTE LA POTENZA NOMINALE, NECESSARIA A MATLAB PER INTERPOLARE LA ROD_POWER, ho aggiunto anche quello 0.01
    cardnumber = cardno+1
    final_line = "{}    {:.4f}     {:.2f} \n".format(cardnumber, t_fin, P0*1000)
    add_power.append(final_line)

    for i in range(len(add_power)):
        print(add_power[i])

    ############### plot
    #fig, ax = plt.subplots()
    #ax.plot(tt, P_impulso, linewidth=2.0)
    #plt.show()


    #####################################################
    #                 MODIFICO L'INPUT                  #
    #####################################################

    os.system(r"mkdir IMPULSE\react_{}".format(round(r*1e5)))      # creo la cartella apposita
    os.system(r'copy "..\..\..\Steady State\Modelli\PWR\input.i" IMPULSE\react_{}\input.i'.format(round(r*1e5)))     # copio l'input

    r_file = open(r'IMPULSE\react_{}\input.i'.format(round(r*1e5)), 'r')
    r_lines = r_file.readlines()
    r_file.close()

    # Power
    for idx, line in enumerate(r_lines):
        if line.split()[0] == str(card_power_100):
            target_line = r_lines[idx]
            break
    line_power_100 = idx+1

    for i in range(len(add_power)):
        r_lines.insert(line_power_100, add_power[len(add_power)-1-i])


    # ALLUNGO LA SIMULAZIONE AGGIUNGENDO LA CARD 204
    r_lines.insert(38, "204     {}     1e-8   0.005   00003   10    10    10 \n".format(t_fin))


    # SCRIVO FILE
    w_file = open(r'IMPULSE\react_{}\input.i'.format(round(r*1e5)), 'w')
    w_file.writelines(r_lines)
    w_file.close()



    #####################################################
    #                    SIMULAZIONE                    #
    #####################################################

    ########### CREO STRUTTURA FOLDER ############
    # Pulisco
    os.system(r'mkdir IMPULSE\react_{}\out'.format(round(r*1e5)))
    while len(os.listdir(r'IMPULSE\react_{}\out'.format(round(r*1e5)))) != 0:
        os.system(r'del IMPULSE\react_{}\out\output'.format(round(r*1e5)))
        os.system(r'del IMPULSE\react_{}\out\output_strip1'.format(round(r*1e5)))
        os.system(r'del IMPULSE\react_{}\out\output_strip2'.format(round(r*1e5)))
        os.system(r'del IMPULSE\react_{}\out\rstplt'.format(round(r*1e5)))
        os.system(r'del IMPULSE\react_{}\out\stripf1'.format(round(r*1e5)))
        os.system(r'del IMPULSE\react_{}\out\stripf2'.format(round(r*1e5)))
        os.system(r'del IMPULSE\react_{}\out\data.csv'.format(round(r*1e5)))
        os.system(r'del IMPULSE\react_{}\out\screen_simulation'.format(round(r*1e5)))
        os.system(r'del IMPULSE\react_{}\out\screen_stripf1'.format(round(r*1e5)))
        os.system(r'del IMPULSE\react_{}\out\screen_stripf2'.format(round(r*1e5)))

    # Lancio simulazione
    os.system(r"..\..\..\utils\execution\relap5.exe -i IMPULSE\react_{}\input.i -o IMPULSE\react_{}\out\output -r IMPULSE\react_{}\out\rstplt -Z ..\..\..\utils\execution\tpfh2onew".format(round(r*1e5),round(r*1e5),round(r*1e5)))

    # Pulisco file inutili e ordino
    os.system(r'del read_steam_comment.o')
    os.system(r'move screen IMPULSE\react_{}\out\screen_simulation'.format(round(r*1e5)))

    # Creo stripf tramite RELAP
    os.system(r"..\..\..\utils\execution\relap5.exe -i input_strip1.i -o IMPULSE\react_{}\out\output_strip1 -r IMPULSE\react_{}\out\rstplt -s IMPULSE\react_{}\out\stripf1".format(round(r*1e5),round(r*1e5),round(r*1e5)))
    os.system(r'move screen IMPULSE\react_{}\out\screen_stripf1'.format(round(r*1e5)))
    os.system(r"..\..\..\utils\execution\relap5.exe -i input_strip2.i -o IMPULSE\react_{}\out\output_strip2 -r IMPULSE\react_{}\out\rstplt -s IMPULSE\react_{}\out\stripf2".format(round(r*1e5),round(r*1e5),round(r*1e5)))
    os.system(r'move screen IMPULSE\react_{}\out\screen_stripf2'.format(round(r*1e5)))

    # Estraggo i dati (creo data.csv)
    os.system(r"cd IMPULSE\react_{} & py ..\..\..\..\..\utils\other\parser.py out\stripf1 out\stripf2".format(round(r*1e5)))

    # Elimino rstplt e output per alleggerire la cartella
    os.system(r'del IMPULSE\react_{}\out\output'.format(round(r*1e5)))
    os.system(r'del IMPULSE\react_{}\out\rstplt'.format(round(r*1e5)))
