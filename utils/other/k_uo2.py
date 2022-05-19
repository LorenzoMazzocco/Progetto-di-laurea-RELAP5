import numpy as np

T_min = 298.15
T_max = 3120

T = np.linspace(T_min, T_max, 100)

tau = T/1000

k = 100/(7.5408 + 17.692*tau + 3.6142*(tau**2)) + (6400/(tau**(5/2)))*np.exp(-16.35/tau)

cardno = 20111101

continuum = []

for i in range(len(T)):
    continuum.append(" {:.2f}  {:.4f}".format(T[i], k[i]))

spezzato = np.array_split(continuum, 25)

for i in range(len(spezzato)):
    print("{} {}".format(cardno+i, ''.join(spezzato[i])))
