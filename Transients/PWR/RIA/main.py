import os
import numpy as np
import matplotlib.pyplot as plt

#####################################################
#                                                   #
#                     VARIABILI                     #
#                                                   #
#####################################################

t_fin = 135.0

m_uo2 = 2.115   # [kg]
P0 = 66.35188   # [kW]

c_fuel = 235     # [J/g/K]  specific heat capacity fuel
beta = 0.0065    # []       delayed neutron fraction
l = 40e-6        # [s]      effective neutron lifetime
ftc = -3         # [pcm/K]  fuel temperature coefficient

t_max = 0

r = 1100e-5      # [] reactivity inserted

card_power_100 = 20288802

#####################################################
#                   PRE-PROCESSING                  #
#####################################################


#####################################################
#           MODELLO DI NORDHEIM-FUCHS               #
#####################################################

P_max = -m_uo2*(c_fuel*(r - beta)**2)/(2*l*ftc)  # [kW]

a = 0.1
n = 100
t = np.linspace(-a,a, n)
delta_t = 2*a/(n-1)
P_impulso = P_max*(1/np.cosh((r-beta)*(t-t_max)/(2*l)))**2  # [kW]

delta_t = (sum(P_impulso>0.5e-2)-1)*delta_t   # [s] durata complessiva impulso
n = 5
tt = np.linspace(-delta_t/2, delta_t/2, n)
P_impulso = P_max*(1/np.cosh((r-beta)*(tt-t_max)/(2*l)))**2  # [kW]

tt = 110 - tt[0] + tt
P_impulso = (P_impulso + P0)*1000 # [W]

print(tt)
print(P_impulso)

add_power = []
add_power.append("{}    {:.1f}     {:.2f} \n".format(card_power_100, 100, P0*1000)) #aggiungo la prima line per il delay di delta_t_scram
cardno = card_power_100

for i in range(len(tt)):
    cardno = cardno+1
    line = "{}    {:.4f}     {:.2f} \n".format(cardno, tt[i], P_impulso[i])
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

os.system(r'copy "..\..\..\Steady State\Modelli\PWR\input.i" input.i')     # copio l'input

r_file = open(r'input.i', 'r')
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
w_file = open(r'input.i', 'w')
w_file.writelines(r_lines)
w_file.close()



#####################################################
#                    SIMULAZIONE                    #
#####################################################

########### CREO STRUTTURA FOLDER ############
# Pulisco
os.system(r'mkdir out')
while len(os.listdir(r'out')) != 0:
    os.system(r'del out\output')
    os.system(r'del out\output_strip1')
    os.system(r'del out\output_strip2')
    os.system(r'del out\rstplt')
    os.system(r'del out\stripf1')
    os.system(r'del out\stripf2')
    os.system(r'del out\data.csv')
    os.system(r'del out\screen_simulation')
    os.system(r'del out\screen_stripf1')
    os.system(r'del out\screen_stripf2')

# Lancio simulazione
os.system(r"..\..\..\utils\execution\relap5.exe -i input.i -o out\output -r out\rstplt -Z ..\..\..\utils\execution\tpfh2onew")

# Pulisco file inutili e ordino
os.system(r'del read_steam_comment.o')
#os.system(r'move screen lambda_{}\out\screen_simulation'.format(l))

# Creo stripf tramite RELAP
os.system(r"..\..\..\utils\execution\relap5.exe -i input_strip1.i -o out\output_strip1 -r out\rstplt -s out\stripf1")
os.system(r'move screen out\screen_stripf1')
os.system(r"..\..\..\utils\execution\relap5.exe -i input_strip2.i -o out\output_strip2 -r out\rstplt -s out\stripf2")
os.system(r'move screen out\screen_stripf2')

# Estraggo i dati (creo data.csv)
os.system(r"py ..\..\..\..\utils\other\parser.py out\stripf1 out\stripf2")

# Elimino rstplt e output per alleggerire la cartella
os.system(r'out\output')
#os.system(r'out\rstplt')
