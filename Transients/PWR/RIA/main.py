import os
import numpy as np
import matplotlib.pyplot as plt

#####################################################
#                                                   #
#                     VARIABILI                     #
#                                                   #
#####################################################

m_uo2 = 2.115   # [kg]

c_fuel = 235     # [J/g/K]  specific heat capacity fuel
beta = 0.0065    # []       delayed neutron fraction
l = 40e-6       # [s]      effective neutron lifetime
ftc = -3         # [pcm/K]  fuel temperature coefficient

t_max = 0

r = 1100e-5      # []

#####################################################
#           MODELLO DI NORDHEIM-FUCHS               #
#####################################################

P_max = -(c_fuel*(r - beta)**2)/(2*l*ftc)  # [kW/kg(UO2)]

t = np.linspace(-0.1,0.1, 1000)
P_impulso = P_max*(1/np.cosh((r-beta)*(t-t_max)/(2*l)))**2  # [kW/kg(UO2)]

# plot
fig, ax = plt.subplots()

ax.plot(t, P_impulso, linewidth=2.0)

plt.show()

# DELTA RHO vs ENERGY

rr = np.linspace(1000, 100000, 1000)*1e-5
E = -m_uo2*2*c_fuel*(rr-beta)/ftc

fig, ax = plt.subplots()

ax.plot(rr*1e5, E, linewidth=2.0)

plt.show()
