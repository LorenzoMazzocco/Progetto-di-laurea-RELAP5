import os
import numpy as np
import sys
sys.path.append('../../../utils/other/')
from python_RELAP_functions import *
sys.path.append('../../"Steady State"/"Sensitivity Analysis"/PWR')


copy_input_command = r"copy ..\..\Modelli\PWR\input.i input.i"
simulate_command = r"..\..\..\utils\execution\relap5.exe -i input.i -o out\output -r out\rstplt -Z ..\..\..\utils\execution\tpfh2onew"
extract_command = r"py ..\..\..\utils\other\parser.py"



##############################################
#                      DATI                  #
##############################################

zirconium = {
        "flag_card" : 20133300,
        "function_card" : 20133301,
        "A0" : 8.8527,
        "A1" : 7.082e-3,
        "A2" : 2.5329e-6,
        "A3" : 0.,
        "A4" : 0.,
        "A5" : 2.9918e+3,
        "C"  : 0.
}

uo2 = {
        "flag_card" : 20111100,
        "initial_data" : 20111101,
        "last_data" : 20111151
}

max_fuel_temperature = {}
max_clad_temperature = {}
MDNBR = {}

########################################################################################################################################################


##############################################
#              RICAVO DATI NOMINALI          #
##############################################

# Pulisco cartella
os.system("mkdir out")
while len(os.listdir('out/')) != 0:
    os.system("del input.i")
    os.system(r"del out\output")
    os.system(r"del out\output_strip")
    os.system(r"del out\rstplt")
    os.system(r"del out\stripf")
    os.system(r"del out\data.csv")

# Copio il file di input
os.system(copy_input_command)

# Eseguo simulazione
os.system(simulate_command)
os.system("del read_steam_comment.o")

# Estraggo i dati
os.system(r"..\..\..\utils\execution\relap5.exe -i input_strip.i -o out\output_strip -r out\rstplt -s out\stripf")
os.system(extract_command)

# Leggo i dati
data = np.genfromtxt("out\data.csv", delimiter=';')
data = data[-1, :] # seleziono gli elementi dell'ultima riga (risultati steady state)

fuel_temp = data[1:51]
clad_temp = data[51:101]
p_output = data[101:151]
x_output = data[151:201]
hf_output = data[201:251]
heat_flux_output = data[251:301]
mass_flow_output = data[301]

max_fuel = max(fuel_temp)
max_clad = max(clad_temp)
chf = CHF_W3(p_output, x_output, mass_flow_output, hf_output, heat_flux_output, 8.79e-5, 1.17808e-2, 3.876)
chfr = np.divide(chf,heat_flux_output)*1000

max_fuel_temperature['nominale'] = max_fuel
max_clad_temperature['nominale'] = max_clad
MDNBR['nominale'] = np.min(chfr)


########################################################################################################################################################


##############################################
#                ANALISI ZIRCONIO            #
##############################################

# Pulisco cartella
os.system("mkdir out")
while len(os.listdir('out/')) != 0:
    os.system("del input.i")
    os.system(r"del out\output")
    os.system(r"del out\output_strip")
    os.system(r"del out\rstplt")
    os.system(r"del out\stripf")
    os.system(r"del out\data.csv")

# Copio il file di input
os.system(copy_input_command)

# MODIFICO I COEFFICIENTI DI CONDUTTIVITA'
r_file = open('input.i', 'r')
lines = r_file.readlines()

# identifico la line corretta data la word
for idx, line in enumerate(lines):
    if line.split()[0] == str(20133301):
        target_line = lines[idx]
        break

words = target_line.split()

mf = 1.05 #multiplication factor
words[3] = "{:.3f}".format(mf*zirconium['A0'])
words[4] = "{:.4e}".format(mf*zirconium['A1'])
words[5] = "{:.4e}".format(mf*zirconium['A2'])
words[6] = "0."
words[7] = "0."
words[8] = "{:.3e}".format(mf*zirconium['A5'])
words.append("\n")
lines[idx] = " ".join(words)
w_file = open('input.i', 'w')
w_file.writelines(lines)
w_file.close()

# Creo una copia dell'input per il caso zirconio
os.system("copy input.i input_zirconium.i")

# Eseguo simulazione relap
os.system(simulate_command)
os.system("del read_steam_comment.o")

# Estraggo i dati
os.system(r"..\..\..\utils\execution\relap5.exe -i input_strip.i -o out\output_strip -r out\rstplt -s out\stripf")
os.system(extract_command)

# Leggo i dati
data = np.genfromtxt("out\data.csv", delimiter=';')
data = data[-1, :] # seleziono gli elementi dell'ultima riga (risultati steady state)

fuel_temp = data[1:51]
clad_temp = data[51:101]
p_output = data[101:151]
x_output = data[151:201]
hf_output = data[201:251]
heat_flux_output = data[251:301]
mass_flow_output = data[301]

max_fuel = max(fuel_temp)
max_clad = max(clad_temp)
chf = CHF_W3(p_output, x_output, mass_flow_output, hf_output, heat_flux_output, 8.79e-5, 1.17808e-2, 3.876)
chfr = np.divide(chf,heat_flux_output)*1000

max_fuel_temperature['zirconium'] = max_fuel
max_clad_temperature['zirconium'] = max_clad
MDNBR['zirconium'] = np.min(chfr)


##########################################################################


##############################################
#                  ANALISI UO2               #
##############################################

# Pulisco cartella
os.system("mkdir out")
while len(os.listdir('out/')) != 0:
    os.system("del input.i")
    os.system(r"del out\output")
    os.system(r"del out\output_strip")
    os.system(r"del out\rstplt")
    os.system(r"del out\stripf")
    os.system(r"del out\data.csv")

# Copio il file di input
os.system(copy_input_command)

# RICREO LA TABELLA DI CONDUCIBILITA' DI UO2
T_min = 298.15
T_max = 3120
T = np.linspace(T_min, T_max, 100)
tau = T/1000
k = 100/(7.5408 + 17.692*tau + 3.6142*(tau**2)) + (6400/(tau**(5/2)))*np.exp(-16.35/tau)
k = mf*k
cardno = uo2['initial_data']
continuum = []
for i in range(len(T)):
    continuum.append(" {:.2f}  {:.4f}".format(T[i], k[i]))
spezzato = np.array_split(continuum, 25)

# identifico la line corretta data la word
for idx, line in enumerate(lines):
    if line.split()[0] == str(uo2['initial_data']):
        target_line = lines[idx]
        break
idx_iniital = idx

for idx, line in enumerate(lines):
    if line.split()[0] == str(uo2['last_data']):
        target_line = lines[idx]
        break
idx_final = idx

# modifico file
r_file = open('input.i', 'r')
lines = r_file.readlines()

for i,idx in enumerate(range(idx_iniital,idx_final)):
    lines[idx] = "{} {}\n".format(cardno+i, ''.join(spezzato[i]))

#scrivo file
w_file = open('input.i', 'w')
w_file.writelines(lines)
w_file.close()

# Creo una copia dell'input per il caso uo2
os.system("copy input.i input_uo2.i")

# Eseguo simulazione relap
os.system(simulate_command)
os.system("del read_steam_comment.o")

# Estraggo i dati
os.system(r"..\..\..\utils\execution\relap5.exe -i input_strip.i -o out\output_strip -r out\rstplt -s out\stripf")
os.system(extract_command)

# Leggo i dati
data = np.genfromtxt("out\data.csv", delimiter=';')
data = data[-1, :] # seleziono gli elementi dell'ultima riga (risultati steady state)

fuel_temp = data[1:51]
clad_temp = data[51:101]
p_output = data[101:151]
x_output = data[151:201]
hf_output = data[201:251]
heat_flux_output = data[251:301]
mass_flow_output = data[301]

max_fuel = max(fuel_temp)
max_clad = max(clad_temp)
chf = CHF_W3(p_output, x_output, mass_flow_output, hf_output, heat_flux_output, 8.79e-5, 1.17808e-2, 3.876)
chfr = np.divide(chf,heat_flux_output)*1000

max_fuel_temperature['uo2'] = max_fuel
max_clad_temperature['uo2'] = max_clad
MDNBR['uo2'] = np.min(chfr)

print(max_fuel_temperature)
print(max_clad_temperature)
print(MDNBR)


########################################################################################################################################################


##############################################
#          ELABORO E SALVO RISULTATI         #
##############################################

# Inizializzo
fuel_relative = []
fuel_adimensional = []
clad_relative = []
clad_adimensional = []
MDNBR_relative = []
MDNBR_adimensional = []

# ZIRCONIUM
delta_function = 100*(mf-1) # pctg points

delta_ft = np.subtract(max_fuel_temperature['zirconium'],max_fuel_temperature['nominale'])
delta_ft_rel = 100*delta_ft/max_fuel_temperature['nominale']
delta_ct = np.subtract(max_clad_temperature['zirconium'],max_clad_temperature['nominale'])
delta_ct_rel = 100*delta_ct/max_clad_temperature['nominale']
delta_mdnbr = np.subtract(MDNBR['zirconium'], MDNBR['nominale'])
delta_mdnbr_rel = 100*delta_mdnbr/MDNBR['nominale']

fuel_relative = np.append(fuel_relative, np.divide(delta_ft, delta_function))
fuel_adimensional = np.append(fuel_adimensional, np.divide(delta_ft_rel, delta_function))
clad_relative = np.append(clad_relative, np.divide(delta_ct, delta_function))
clad_adimensional = np.append(clad_adimensional, np.divide(delta_ct_rel,delta_function))
MDNBR_relative = np.append(MDNBR_relative, np.divide(delta_mdnbr, delta_function))
MDNBR_adimensional = np.append(MDNBR_adimensional, np.divide(delta_mdnbr_rel, delta_function))

# UO2
delta_function = 100*(mf-1) # pctg points

delta_ft = np.subtract(max_fuel_temperature['uo2'],max_fuel_temperature['nominale'])
delta_ft_rel = 100*delta_ft/max_fuel_temperature['nominale']
delta_ct = np.subtract(max_clad_temperature['uo2'],max_clad_temperature['nominale'])
delta_ct_rel = 100*delta_ct/max_clad_temperature['nominale']
delta_mdnbr = np.subtract(MDNBR['uo2'], MDNBR['nominale'])
delta_mdnbr_rel = 100*delta_mdnbr/MDNBR['nominale']

fuel_relative = np.append(fuel_relative, np.divide(delta_ft, delta_function))
fuel_adimensional = np.append(fuel_adimensional, np.divide(delta_ft_rel, delta_function))
clad_relative = np.append(clad_relative, np.divide(delta_ct, delta_function))
clad_adimensional = np.append(clad_adimensional, np.divide(delta_ct_rel,delta_function))
MDNBR_relative = np.append(MDNBR_relative, np.divide(delta_mdnbr, delta_function))
MDNBR_adimensional = np.append(MDNBR_adimensional, np.divide(delta_mdnbr_rel, delta_function))

# SALVO IL CSV
header=["Zr", "UO2"]
header=';'.join(header)

body_relative = np.vstack((fuel_relative,clad_relative,MDNBR_relative))
body_adimensional = np.vstack((fuel_adimensional,clad_adimensional,MDNBR_adimensional))
np.savetxt('sensitivity_conductivity_relative.csv', body_relative, delimiter=';', comments='', fmt='%.6e', header=header)
np.savetxt('sensitivity_conductivity_adimensional.csv', body_adimensional, delimiter=';', comments='', fmt='%.6e', header=header)




##############################################
#             PULISCO LA CARTELLA            #
##############################################
while len(os.listdir('out/')) != 0:
    os.system("del input.i")
    os.system(r"del out\output")
    os.system(r"del out\output_strip")
    os.system(r"del out\rstplt")
    os.system(r"del out\stripf")
    os.system(r"del out\data.csv")
os.system(r"rd out")
# elimino file superflui
os.system(r"del screen")
os.system(r"del input.i")
