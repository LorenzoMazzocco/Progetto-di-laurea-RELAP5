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

t_max = 0

enthalpies = np.array([80, 100, 120])      # [J/g] enthalpy increase

card_power_100 = 20288802







for h in enthalpies:
    #####################################################
    #                   PRE-PROCESSING                  #
    #####################################################

    #####################################################
    #                MODELLO A CAPANNA                  #
    #####################################################

    energy = h * m_uo2  # [kJ]

    tau = 4.5 - 0.0342*(h-10) # [s]

    P_max = energy/tau;

    add_power = []
    add_power.append("{}    {:.2f}     {:.2f} \n".format(card_power_100, 100.01, P0*1000)) #aggiungo la prima line per il delay di delta_t_scram
    cardno = card_power_100


    cardno = cardno+1
    line = "{}    {:.4f}     {:.2f} \n".format(cardno, 110, P0*1000)
    add_power.append(line)

    cardno = cardno+1
    line = "{}    {:.4f}     {:.2f} \n".format(cardno, 110+tau, (P0+P_max)*1000)
    add_power.append(line)

    cardno = cardno+1
    line = "{}    {:.4f}     {:.2f} \n".format(cardno, 110+2*tau, P0*1000)
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

    os.system(r"mkdir IMPULSE\enthalpy_{}".format(round(h)))      # creo la cartella apposita
    os.system(r'copy "..\..\..\Steady State\Modelli\PWR\input.i" IMPULSE\enthalpy_{}\input.i'.format(round(h)))     # copio l'input

    r_file = open(r'IMPULSE\enthalpy_{}\input.i'.format(round(h)), 'r')
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
    w_file = open(r'IMPULSE\enthalpy_{}\input.i'.format(round(h)), 'w')
    w_file.writelines(r_lines)
    w_file.close()



    #####################################################
    #                    SIMULAZIONE                    #
    #####################################################

    ########### CREO STRUTTURA FOLDER ############
    # Pulisco
    os.system(r'mkdir IMPULSE\enthalpy_{}\out'.format(round(h)))
    while len(os.listdir(r'IMPULSE\enthalpy_{}\out'.format(round(h)))) != 0:
        os.system(r'del IMPULSE\enthalpy_{}\out\output'.format(round(h)))
        os.system(r'del IMPULSE\enthalpy_{}\out\output_strip1'.format(round(h)))
        os.system(r'del IMPULSE\enthalpy_{}\out\output_strip2'.format(round(h)))
        os.system(r'del IMPULSE\enthalpy_{}\out\rstplt'.format(round(h)))
        os.system(r'del IMPULSE\enthalpy_{}\out\stripf1'.format(round(h)))
        os.system(r'del IMPULSE\enthalpy_{}\out\stripf2'.format(round(h)))
        os.system(r'del IMPULSE\enthalpy_{}\out\data.csv'.format(round(h)))
        os.system(r'del IMPULSE\enthalpy_{}\out\screen_simulation'.format(round(h)))
        os.system(r'del IMPULSE\enthalpy_{}\out\screen_stripf1'.format(round(h)))
        os.system(r'del IMPULSE\enthalpy_{}\out\screen_stripf2'.format(round(h)))

    # Lancio simulazione
    os.system(r"..\..\..\utils\execution\relap5.exe -i IMPULSE\enthalpy_{}\input.i -o IMPULSE\enthalpy_{}\out\output -r IMPULSE\enthalpy_{}\out\rstplt -Z ..\..\..\utils\execution\tpfh2onew".format(round(h),round(h),round(h)))

    # Pulisco file inutili e ordino
    os.system(r'del read_steam_comment.o')
    os.system(r'move screen IMPULSE\enthalpy_{}\out\screen_simulation'.format(round(h)))

    # Creo stripf tramite RELAP
    os.system(r"..\..\..\utils\execution\relap5.exe -i input_strip1.i -o IMPULSE\enthalpy_{}\out\output_strip1 -r IMPULSE\enthalpy_{}\out\rstplt -s IMPULSE\enthalpy_{}\out\stripf1".format(round(h),round(h),round(h)))
    os.system(r'move screen IMPULSE\enthalpy_{}\out\screen_stripf1'.format(round(h)))
    os.system(r"..\..\..\utils\execution\relap5.exe -i input_strip2.i -o IMPULSE\enthalpy_{}\out\output_strip2 -r IMPULSE\enthalpy_{}\out\rstplt -s IMPULSE\enthalpy_{}\out\stripf2".format(round(h),round(h),round(h)))
    os.system(r'move screen IMPULSE\enthalpy_{}\out\screen_stripf2'.format(round(h)))

    # Estraggo i dati (creo data.csv)
    os.system(r"cd IMPULSE\enthalpy_{} & py ..\..\..\..\..\utils\other\parser.py out\stripf1 out\stripf2".format(round(h)))

    # Elimino rstplt e output per alleggerire la cartella
    os.system(r'del IMPULSE\enthalpy_{}\out\output'.format(round(h)))
    os.system(r'del IMPULSE\enthalpy_{}\out\rstplt'.format(round(h)))
