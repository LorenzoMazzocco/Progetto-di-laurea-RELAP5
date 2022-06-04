import os
import numpy as np
import matplotlib.pyplot as plt

#####################################################
#                                                   #
#                     VARIABILI                     #
#                                                   #
#####################################################

t_fin = 150.0   # [s]

P0 = 66.35188   # [kW]

lambdas = np.array([0.05, 0.075, 0.1, 0.15])      # exponential coefficient

card_power_100 = 20288802



for l in lambdas:
    #####################################################
    #                   PRE-PROCESSING                  #
    #####################################################

    # CREO INTERPOLAZIONE LINEARE CON n PUNTI da dare in input a relap
    n = 97
    tt = np.linspace(101.0, t_fin, n)
    P_t = P0-1 + np.exp(l*(tt-100))

    add_power = []
    cardno = card_power_100

    for i in range(len(tt)):
        cardno = cardno+1
        line = "{}    {:.4f}     {:.2f} \n".format(cardno, tt[i], P_t[i]*1000)
        add_power.append(line)

    for i in range(len(add_power)):
        print(add_power[i])

    ############### plot
    #fig, ax = plt.subplots()
    #ax.plot(tt, P_impulso, linewidth=2.0)
    #plt.show()


    #####################################################
    #                 MODIFICO L'INPUT                  #
    #####################################################

    os.system(r"mkdir EXP\lambda_{}".format(l))      # creo la cartella apposita
    os.system(r'copy "..\..\..\Steady State\Modelli\PWR\input.i" EXP\lambda_{}\input.i'.format(l))     # copio l'input

    r_file = open(r'EXP\lambda_{}\input.i'.format(l), 'r')
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
    w_file = open(r'EXP\lambda_{}\input.i'.format(l), 'w')
    w_file.writelines(r_lines)
    w_file.close()



    #####################################################
    #                    SIMULAZIONE                    #
    #####################################################

    ########### CREO STRUTTURA FOLDER ############
    # Pulisco
    os.system(r'mkdir EXP\lambda_{}\out'.format(l))
    while len(os.listdir(r'EXP\lambda_{}\out'.format(l))) != 0:
        os.system(r'del EXP\lambda_{}\out\output'.format(l))
        os.system(r'del EXP\lambda_{}\out\output_strip1'.format(l))
        os.system(r'del EXP\lambda_{}\out\output_strip2'.format(l))
        os.system(r'del EXP\lambda_{}\out\rstplt'.format(l))
        os.system(r'del EXP\lambda_{}\out\stripf1'.format(l))
        os.system(r'del EXP\lambda_{}\out\stripf2'.format(l))
        os.system(r'del EXP\lambda_{}\out\data.csv'.format(l))
        os.system(r'del EXP\lambda_{}\out\screen_simulation'.format(l))
        os.system(r'del EXP\lambda_{}\out\screen_stripf1'.format(l))
        os.system(r'del EXP\lambda_{}\out\screen_stripf2'.format(l))

    # Lancio simulazione
    os.system(r"..\..\..\utils\execution\relap5.exe -i EXP\lambda_{}\input.i -o EXP\lambda_{}\out\output -r EXP\lambda_{}\out\rstplt -Z ..\..\..\utils\execution\tpfh2onew".format(l,l,l))

    # Pulisco file inutili e ordino
    os.system(r'del read_steam_comment.o')
    os.system(r'move screen EXP\lambda_{}\out\screen_simulation'.format(l))

    # Creo stripf tramite RELAP
    os.system(r"..\..\..\utils\execution\relap5.exe -i input_strip1.i -o EXP\lambda_{}\out\output_strip1 -r EXP\lambda_{}\out\rstplt -s EXP\lambda_{}\out\stripf1".format(l,l,l))
    os.system(r'move screen EXP\lambda_{}\out\screen_stripf1'.format(l))
    os.system(r"..\..\..\utils\execution\relap5.exe -i input_strip2.i -o EXP\lambda_{}\out\output_strip2 -r EXP\lambda_{}\out\rstplt -s EXP\lambda_{}\out\stripf2".format(l,l,l))
    os.system(r'move screen EXP\lambda_{}\out\screen_stripf2'.format(l))

    # Estraggo i dati (creo data.csv)
    os.system(r"cd EXP\lambda_{} & py ..\..\..\..\..\utils\other\parser.py out\stripf1 out\stripf2".format(l))

    # Elimino rstplt e output per alleggerire la cartella
    os.system(r'del EXP\lambda_{}\out\output'.format(l))
    os.system(r'del EXP\lambda_{}\out\rstplt'.format(l))
