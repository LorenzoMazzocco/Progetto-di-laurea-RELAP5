$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$                                                                           $$
$$                            PWR HEATED CHANNEL                             $$
$$                                                                           $$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$[Mazzocco, Musile Tanzi, Tagliabue]$$$$$$
*
*Titlecard
=pwr_channel
*
*crdno  Probtype    Option
100       new      transnt
*
*crdno  Check_or_Run
101         run
*101 inp-chk
*
*crdno   Inunits  Outunits
102        si        si
*
*
*
*******************************************************************************
*                         TIME STEP CONTROL CARDS                             *
*******************************************************************************
*
*crdno   Initialtime[s]
200           0.
*crdno   Endtime[s] Mindt[s]  Maxdt[s]   ctrl  Minedit  Majedit   Rst
201        1.        1.e-8    0.001     00003   500      500     500
*
*crdno   Endtime[s] Mindt[s]  Maxdt[s]   ctrl  Minedit  Majedit   Rst
202        10.       1.e-8     0.01     00003    50       50      50
*
*crdno   Endtime[s] Mindt[s]  Maxdt[s]   ctrl  Minedit  Majedit   Rst
203        100.      1.e-8     0.05     00003   10        10      10
*
204     932.5     1.e-8   0.05   00003   10    10    10 
* (201 writes every 0.5 s)
* (202 writes every 0.5 s)
* (203 writes every 0.5 s)
*
*
*
******************************************************************************
*                                   TRIPS                                    *
******************************************************************************
*
* Dobbiamo inserirli per far partire la simulazione (forse)
*
*
*
*
*||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
*|||||||||||||||||||||||||||     Hydraulic components    ||||||||||||||||||||||
*||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
*
**
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$                                                                             $
$                        COMPONENT 100 - LOWER RESERVOIR                      $
$                                                                             $
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
*
*crdno       Name        Type
1000000     l_tank    tmdpvol
*
*crdno    Volflowarea[m^2]   Vollength[m]   Volvolume[m^3]
1000101       1.e+5               1.             0.
*
*crdno    Azangle   Vertangle   Elevchange[m]
1000102      0.        90.          1.
*
*crdno   Rough[m]  Dhyd[m]    Control Flags
1000103      0.       0.           0000000
*
*--------------------------- VOLUME DATA ----------------------------
*
*crdno   ebt   W2   W3
1000200  003
*
*crdno   Time[s]      P[Pa]      T[K]
*
1000201     0.      1.551e+7    566.25
1000202   100.      1.551e+7    566.25
1000202  100.0   1.55100e+07   566.25 
1000203  107.6   1.44037e+07   566.11 
1000204  115.1   1.33779e+07   565.98 
1000205  122.7   1.24267e+07   565.85 
1000206  130.2   1.15446e+07   565.73 
1000207  137.8   1.07268e+07   565.61 
1000208  145.3   9.96838e+06   565.49 
1000209  152.9   9.26515e+06   565.39 
1000210  160.4   8.61307e+06   565.28 
1000211  168.0   8.00843e+06   565.18 
1000212  175.5   7.44776e+06   563.21 
1000213  183.1   6.92787e+06   558.28 
1000214  190.6   6.44579e+06   553.45 
1000215  198.2   5.99878e+06   548.72 
1000216  205.7   5.58428e+06   544.09 
1000217  213.3   5.19993e+06   539.55 
1000218  220.8   4.84354e+06   535.11 
1000219  228.4   4.51306e+06   530.77 
1000220  235.9   4.20663e+06   526.51 
1000221  243.5   3.92248e+06   522.35 
1000222  251.0   3.65900e+06   518.28 
1000223  258.6   3.41469e+06   514.30 
1000224  266.1   3.18814e+06   510.41 
1000225  273.7   2.97807e+06   506.60 
1000226  281.2   2.78328e+06   502.89 
1000227  288.8   2.60266e+06   499.26 
1000228  296.3   2.43518e+06   495.71 
1000229  303.9   2.27988e+06   492.26 
1000230  311.4   2.13587e+06   488.88 
1000231  319.0   2.00234e+06   485.59 
1000232  326.5   1.87852e+06   482.39 
1000233  334.1   1.76371e+06   479.27 
1000234  341.6   1.65725e+06   476.23 
1000235  349.2   1.55853e+06   473.27 
1000236  356.8   1.46699e+06   470.39 
1000237  364.3   1.38211e+06   467.60 
1000238  371.9   1.30340e+06   464.88 
1000239  379.4   1.23042e+06   462.25 
1000240  387.0   1.16275e+06   459.69 
1000241  394.5   1.09999e+06   457.22 
1000242  402.1   1.04181e+06   454.82 
1000243  409.6   9.87852e+05   452.51 
1000244  417.2   9.37822e+05   450.26 
1000245  424.7   8.91430e+05   448.10 
1000246  432.3   8.48413e+05   446.01 
1000247  439.8   8.08524e+05   444.00 
1000248  447.4   7.71537e+05   442.07 
1000249  454.9   7.37240e+05   440.20 
1000250  462.5   7.05437e+05   438.42 
1000251  470.0   6.75948e+05   436.70 
1000252  477.6   6.48604e+05   435.05 
1000253  485.1   6.23248e+05   433.47 
1000254  492.7   5.99737e+05   431.97 
1000255  500.2   5.77935e+05   430.52 
1000256  507.8   5.57720e+05   429.15 
1000257  515.3   5.38975e+05   427.84 
1000258  522.9   5.21593e+05   426.59 
1000259  530.4   5.05476e+05   425.40 
1000260  538.0   4.90530e+05   424.27 
1000261  545.5   4.76672e+05   423.19 
1000262  553.1   4.63822e+05   422.18 
1000263  560.6   4.51906e+05   421.21 
1000264  568.2   4.40858e+05   420.30 
1000265  575.7   4.30612e+05   419.44 
1000266  583.3   4.21112e+05   418.63 
1000267  590.9   4.12303e+05   417.86 
1000268  598.4   4.04135e+05   417.13 
1000269  606.0   3.96561e+05   416.45 
1000270  613.5   3.89537e+05   415.81 
1000271  621.1   3.83025e+05   415.21 
1000272  628.6   3.76986e+05   414.64 
1000273  636.2   3.71387e+05   414.11 
1000274  643.7   3.66194e+05   413.61 
1000275  651.3   3.61380e+05   413.14 
1000276  658.8   3.56915e+05   412.70 
1000277  666.4   3.52776e+05   412.29 
1000278  673.9   3.48937e+05   411.90 
1000279  681.5   3.45378e+05   411.54 
1000280  689.0   3.42077e+05   411.21 
1000281  696.6   3.39017e+05   410.89 
1000282  704.1   3.36179e+05   410.60 
1000283  711.7   3.33547e+05   410.33 
1000284  719.2   3.31107e+05   410.07 
1000285  726.8   3.28845e+05   409.83 
1000286  734.3   3.26747e+05   409.61 
1000287  741.9   3.24801e+05   409.40 
1000288  749.4   3.22997e+05   409.21 
1000289  757.0   3.21325e+05   409.03 
1000290  764.5   3.19774e+05   408.87 
1000291  772.1   3.18335e+05   408.71 
1000292  779.6   3.17002e+05   408.57 
1000293  787.2   3.15765e+05   408.43 
1000294  794.7   3.14618e+05   408.31 
1000295  802.3   3.13555e+05   408.19 
1000296  809.8   3.12569e+05   408.08 
1000297  817.4   3.11655e+05   407.98 
1000298  824.9   3.10807e+05   407.89 
1000299  832.5   3.10021e+05   407.80 
*
*------------------------------------------------------------------------------
*
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$                                                                             $
$                      COMPONENT 110 - INLET JUNCTION                         $
$                                                                             $
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
*
*crdno     Name     Type
1100000   feedin   tmdpjun
*
*crdno       From        To      Junarea[m^2]
1100101    100010000  555010001      0.
*
*--------------------------- JUNCTION DATA ----------------------------
*
*crdno    Controlword    W2   W3   W4
1100200       1 *  (0 = velocity ; 1 = mass flow rate)
*
*crdno    Time[s]   Ml[kg/s]   Mv[kg/s]   Vint[m/s]
*
1100201      0.      0.335         0.          0.
1100202     50.      0.335         0.          0.
*
*----------------------------------------------------------------------
*
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$                                                                             $
$                      COMPONENT 555 - HEATED CHANNEL                         $
$                                                                             $
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
*
*crdno      Name     Type
5550000    channel   pipe
*
*crdno   Number of volumes
5550001        50
*
*crdno  Volflowarea[m^2]  Volno
5550101    8.79e-5         50
*
*crdno Junctionflowarea[m^2]  Junno
5550201        0.               49
*
*crdno    Vollength[m]   Volno
5550301     7.752e-2      50
*
*crdno   Volumevol[m^3]    Volno
5550401       0.            50
*
*crdno   Azangle  Volno
5550501     0.     50
*
*crdno   Vertangle  Volno
5550601    90.       50
*
*crdno    Rough[m]    Dhyd[m]   Volno
5550801   1.52e-6   1.17808e-2   50
*
*crdno   Forloss  Revloss  Junno
5550901    0.      0.       49
*
*crdno   Volume Control Flags   Volno
5551001        0000000           50
*
*
*crdno   Junction Control Flags   Junno
5551101        0001000             49
*
*
*--------------------------- VOLUMES IC -------------------------------
*
*crdno    ebt    P[Pa]     T[K]    W4   W5   W6    Volno
5551201   003   15.51e+6   566.25   0.   0.   0.    50
*
*-------------------------- JUNCTIONS IC ------------------------------
*
*crdno   Control Word
5551300       1
*
*crdno   Ml[kg/s]     Mg[kg/s]   Vint[m/s]   Junno
5551301    0.           0.         0.         49
* ?= Non so se è più veloce porre queste a zero o al mass flow rate nominale per arrivare a steady state prima
*-----------------------------------------------------------------------------
*
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$                                                                             $
$                       COMPONENT 200 - UPPER RESERVOIR                       $
$                                                                             $
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
*
*crdno       Name        Type
2000000     u_tank      tmdpvol
*
*crdno    Volflowarea[m^2]   Vollength[m]   Volvolume[m^3]
2000101       1.e+5               1.             0.
*
*crdno    Azangle   Vertangle   Elevchange[m]
2000102      0.        90.          1.
*
*crdno   Rough[m]  Dhyd[m]    Control Flags
2000103      0.       0.         0000000
*
*--------------------------- VOLUME DATA ----------------------------
*
*crdno   ebt   W2   W3
2000200  003
*
*crdno   Time[s]      P[Pa]      T[K]
*
2000201     0.      1.5313e+7    566.25
2000202   100.      1.5313e+7    566.25
2000202  100.0   1.53130e+07   566.25 
2000203  107.6   1.42067e+07   566.25 
2000204  115.1   1.31809e+07   566.25 
2000205  122.7   1.22297e+07   566.25 
2000206  130.2   1.13476e+07   566.25 
2000207  137.8   1.05298e+07   566.25 
2000208  145.3   9.77138e+06   566.25 
2000209  152.9   9.06815e+06   566.25 
2000210  160.4   8.41607e+06   566.25 
2000211  168.0   7.81143e+06   566.25 
2000212  175.5   7.25076e+06   566.25 
2000213  183.1   6.73087e+06   566.25 
2000214  190.6   6.24879e+06   566.25 
2000215  198.2   5.80178e+06   566.25 
2000216  205.7   5.38728e+06   566.25 
2000217  213.3   5.00293e+06   566.25 
2000218  220.8   4.64654e+06   566.25 
2000219  228.4   4.31606e+06   566.25 
2000220  235.9   4.00963e+06   566.25 
2000221  243.5   3.72548e+06   566.25 
2000222  251.0   3.46200e+06   566.25 
2000223  258.6   3.21769e+06   566.25 
2000224  266.1   2.99114e+06   566.25 
2000225  273.7   2.78107e+06   566.25 
2000226  281.2   2.58628e+06   566.25 
2000227  288.8   2.40566e+06   566.25 
2000228  296.3   2.23818e+06   566.25 
2000229  303.9   2.08288e+06   566.25 
2000230  311.4   1.93887e+06   566.25 
2000231  319.0   1.80534e+06   566.25 
2000232  326.5   1.68152e+06   566.25 
2000233  334.1   1.56671e+06   566.25 
2000234  341.6   1.46025e+06   566.25 
2000235  349.2   1.36153e+06   566.25 
2000236  356.8   1.26999e+06   566.25 
2000237  364.3   1.18511e+06   566.25 
2000238  371.9   1.10640e+06   566.25 
2000239  379.4   1.03342e+06   566.25 
2000240  387.0   9.65746e+05   566.25 
2000241  394.5   9.02995e+05   566.25 
2000242  402.1   8.44808e+05   566.25 
2000243  409.6   7.90852e+05   566.25 
2000244  417.2   7.40822e+05   566.25 
2000245  424.7   6.94430e+05   566.25 
2000246  432.3   6.51413e+05   566.25 
2000247  439.8   6.11524e+05   566.25 
2000248  447.4   5.74537e+05   566.25 
2000249  454.9   5.40240e+05   566.25 
2000250  462.5   5.08437e+05   566.25 
2000251  470.0   4.78948e+05   566.25 
2000252  477.6   4.51604e+05   566.25 
2000253  485.1   4.26248e+05   566.25 
2000254  492.7   4.02737e+05   566.25 
2000255  500.2   3.80935e+05   566.25 
2000256  507.8   3.60720e+05   566.25 
2000257  515.3   3.41975e+05   566.25 
2000258  522.9   3.24593e+05   566.25 
2000259  530.4   3.08476e+05   566.25 
2000260  538.0   2.93530e+05   566.25 
2000261  545.5   2.79672e+05   566.25 
2000262  553.1   2.66822e+05   566.25 
2000263  560.6   2.54906e+05   566.25 
2000264  568.2   2.43858e+05   566.25 
2000265  575.7   2.33612e+05   566.25 
2000266  583.3   2.24112e+05   566.25 
2000267  590.9   2.15303e+05   566.25 
2000268  598.4   2.07135e+05   566.25 
2000269  606.0   1.99561e+05   566.25 
2000270  613.5   1.92537e+05   566.25 
2000271  621.1   1.86025e+05   566.25 
2000272  628.6   1.79986e+05   566.25 
2000273  636.2   1.74387e+05   566.25 
2000274  643.7   1.69194e+05   566.25 
2000275  651.3   1.64380e+05   566.25 
2000276  658.8   1.59915e+05   566.25 
2000277  666.4   1.55776e+05   566.25 
2000278  673.9   1.51937e+05   566.25 
2000279  681.5   1.48378e+05   566.25 
2000280  689.0   1.45077e+05   566.25 
2000281  696.6   1.42017e+05   566.25 
2000282  704.1   1.39179e+05   566.25 
2000283  711.7   1.36547e+05   566.25 
2000284  719.2   1.34107e+05   566.25 
2000285  726.8   1.31845e+05   566.25 
2000286  734.3   1.29747e+05   566.25 
2000287  741.9   1.27801e+05   566.25 
2000288  749.4   1.25997e+05   566.25 
2000289  757.0   1.24325e+05   566.25 
2000290  764.5   1.22774e+05   566.25 
2000291  772.1   1.21335e+05   566.25 
2000292  779.6   1.20002e+05   566.25 
2000293  787.2   1.18765e+05   566.25 
2000294  794.7   1.17618e+05   566.25 
2000295  802.3   1.16555e+05   566.25 
2000296  809.8   1.15569e+05   566.25 
2000297  817.4   1.14655e+05   566.25 
2000298  824.9   1.13807e+05   566.25 
2000299  832.5   1.13021e+05   566.25 
*
*------------------------------------------------------------------------------
*
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$                                                                             $
$                      COMPONENT 210 - OUTLET JUNCTION                        $
$                                                                             $
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
*
*crdno     Name     Type
2100000   outlet   sngljun
*
*crdno       From        To      Junarea[m^2]
2100101    555500002  200010000      0.
*
*crdno     Area[m^2]    Loss K fwd    Loss K bwd
2100102       0.             0.           0.
*
*--------------------------- JUNCTION IC ----------------------------
*
*crdno    Controlword        Ml[kg/s]      Mv[kg/s]      Vint[m/s]
2100201        1                0.             0.            0.
*
*------------------------------------------------------------------------------
*
*
*
*||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
*|||||||||||||||||||||||||||    HEAT STRUCTURES    ||||||||||||||||||||||||||||
*||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
*
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$                                                                             $
$                      HEAT STRUCTURE 555 - FUEL ROD                          $
$                                                                             $
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
*
*crdno    Naxial  Nradial  Geomtype  SSFlag  Leftboundary[m]
15550000   50       10        2        0         0.0
$ ho messo np=4 perchè considero: centro del fuel pellet + esterno del fuel pellet (raggio di 0.004096 m) + interno del cladding + esterno del cladding$
$ con la SSFlag=1 RELAP prende le temperature iniziali date in input nelle card 1CCCG402-G499 e si porta in steady-state (credo sia l'opzione migliore, così possiamo $
$ analizzare i transitori partendo da una condizione di regime). Se SSFlag=0, RELAP prende come temperature iniziali quelle nella card 1CCCG401 e non si porta in $
$ steady-state condition $
*
*crdno     Initial He Pressure [Pa]    ReferenceVolume
15550001         2410000.0                555480000
*
*crdno   FuelRough CladRough  FGDispl CDRDispl  HeatStructureNo
15550011   1.0e-6    2.0e-6    0.0     0.0         50
*
*crdno     MeshLocationFlag    MeshFormatFlag
15550100          0                  1
*
*crdno     NoIntervals   Rightcoord[m]
15550101        6          0.004069
15550102        1          0.0041786
15550103        2          0.0047506
*
*crdno     Compositionno    Intervalno
15550201        111             6
15550202        222             7
15550203        333             9
*
*crdno     Source    MeshIntervalno   Source    MeshIntervalno
15550301   0.16667        6             0.            9
*
*crdno     Initialtempflag
15550400         0
*
*crdno   Initial T[K]    MeshPointNo
15550401    600.0             10
*
*
*---------------------- LEFT BOUNDARY CONDITION -------------------------
*
*crdno   Boundaryvolno  Increment    BCtype    SAcode   SAfactor     Heatstno
15550501       0            0           0        1      0.07752         50
*
*
*---------------------- RIGHT BOUNDARY CONDITION ------------------------
*
*crdno      Tableno     Increment   BCtype  SAcode  SAfactor   Heatstno
15550601   555010004      10000        1      1     0.07752       50
$ ho messo come altezza di ogni heat structure 0.07752 m, cioè 1/50 dell'altezza totale della fuel rod indicata dal Kazimi per il PWR: 3.876 m . Tuttavia viene $
$ indicata un'altezza leggermente minore relativa alla porzione di fuel rod scaldata: va chiarito quale delle 2 inserire e se/come considerare il profilo di $
$ temperatura e di potenza scambiata lungo la fuel rod $
$ la W3 andrebbe controllata meglio, ho messo 1 ad indicare uno scambio termico convettivo di default ma si può andare più nello specifico$
*
*
*------------------------------ SOURCE DATA -------------------------------
*
*crdno   SourceTyp  Multiplier     W3     W4   HeatStNo
15550701    888    0.001070538     0.     0.     1
15550702    888    0.003207030     0.     0.     2
15550703    888    0.005329790     0.     0.     3
15550704    888    0.007429727     0.     0.     4
15550705    888    0.009497848     0.     0.     5
15550706    888    0.011525298     0.     0.     6
15550707    888    0.013503395     0.     0.     7
15550708    888    0.015423668     0.     0.     8
15550709    888    0.017277895     0.     0.     9
15550710    888    0.019058136     0.     0.     10
15550711    888    0.020756766     0.     0.     11
15550712    888    0.022366513     0.     0.     12
15550713    888    0.023880483     0.     0.     13
15550714    888    0.025292193     0.     0.     14
15550715    888    0.026595597     0.     0.     15
15550716    888    0.027785116     0.     0.     16
15550717    888    0.028855654     0.     0.     17
15550718    888    0.029802628     0.     0.     18
15550719    888    0.030621983     0.     0.     19
15550720    888    0.031310210     0.     0.     20
15550721    888    0.031864361     0.     0.     21
15550722    888    0.032282064     0.     0.     22
15550723    888    0.032561531     0.     0.     23
15550724    888    0.032701564     0.     0.     24
15550725    888    0.032701564     0.     0.     25
15550726    888    0.032561531     0.     0.     26
15550727    888    0.032282064     0.     0.     27
15550728    888    0.031864361     0.     0.     28
15550729    888    0.031310210     0.     0.     29
15550730    888    0.030621983     0.     0.     30
15550731    888    0.029802628     0.     0.     31
15550732    888    0.028855654     0.     0.     32
15550733    888    0.027785116     0.     0.     33
15550734    888    0.026595597     0.     0.     34
15550735    888    0.025292193     0.     0.     35
15550736    888    0.023880483     0.     0.     36
15550737    888    0.022366513     0.     0.     37
15550738    888    0.020756766     0.     0.     38
15550739    888    0.019058136     0.     0.     39
15550740    888    0.017277895     0.     0.     40
15550741    888    0.015423668     0.     0.     41
15550742    888    0.013503395     0.     0.     42
15550743    888    0.011525298     0.     0.     43
15550744    888    0.009497848     0.     0.     44
15550745    888    0.007429727     0.     0.     45
15550746    888    0.005329790     0.     0.     46
15550747    888    0.003207030     0.     0.     47
15550748    888    0.001070538     0.     0.     48
15550749    888    0.000000000     0.     0.     49
15550750    888    0.000000000     0.     0.     50

$ se la SSFlag nella W4 della card 1CCCG000 è 1 allora devo dare in input una potenza iniziale, se invece è 0 non ce n'è bisogno $
$ dalla general table 888 ricevo in input nella W1 la potenza termica generata nella fuel rod. La W2 indica la frazione di questa $
$ potenza totale associata a ciascuna heat structure. Le W3 e W4 indicano quanta di questa potenza è trasferita per irraggiamento $
$ (direct heating) al fluido. La somma di questi fattori tra tutte le heat structures deve essere 1 $
$$$$$ PROFILO ASSIALE DELLA POTENZA TERMICA NELLA FUEL ROD DA SISTEMARE $$$$$
*
*
*------------------ ADDITIONAL RIGHT BOUNDARY CONDITION -------------------
*
*crdno    W1
15550900  0   * 9 word format
*
*crdno       Dth[m]      W2   W3   W4  W5  W6  W7   W8   Heatstno
15550901   1.17808e-2    15.  15.  0.  0.  0.  0.   1.     50
*
*
*--------------------------------------------------------------------------
*
*||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
*|||||||||||||||||||||||||||      GENERAL TABLES      |||||||||||||||||||||||||
*||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
*
*
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$                                                                             $
$                               TABLE - MATERIALS                             $
$                                                                             $
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
*
20111100  uo2
20122200  tbl/fctn  3   1       * gas mixture
20122201  helium  1.0
20122202  xenon   0.0
20122251  10.126  *[J/m^3/°K]
20133300  zr
$ la card 001 della heat structure richiede che la W2 della card 00 sia 3. Ma la W2 in teoria è necessaria solo se inseriamo manualmente $
$ i dati sui materiali, quindi non dovrebbe essere necessaria. Vediamo se il codice funziona o no e in base a quello decidiamo $
*
*
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$                                                                             $
$                  TABLE 888 - GENERATED POWER vs TIME                        $
$                                                                             $
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
*
*crdno      Tabletype   Trip   Factors
20288800     power
*
*crdno         t[s]     Power [W]
20288801        0.      66351.88
20288802       100.     66351.88
20288802    100.5     66351.88 
20288803    101.0     4610.20 
20288804    109.7     2519.45 
20288805    118.3     2189.20 
20288806    127.0     2012.53 
20288807    135.6     1894.62 
20288808    144.3     1807.33 
20288809    153.0     1738.65 
20288810    161.6     1682.40 
20288811    170.3     1634.98 
20288812    179.0     1594.15 
20288813    187.6     1558.40 
20288814    196.3     1526.68 
20288815    204.9     1498.24 
20288816    213.6     1472.49 
20288817    222.3     1449.00 
20288818    230.9     1427.44 
20288819    239.6     1407.53 
20288820    248.2     1389.06 
20288821    256.9     1371.84 
20288822    265.6     1355.73 
20288823    274.2     1340.61 
20288824    282.9     1326.36 
20288825    291.6     1312.91 
20288826    300.2     1300.16 
20288827    308.9     1288.07 
20288828    317.5     1276.56 
20288829    326.2     1265.59 
20288830    334.9     1255.11 
20288831    343.5     1245.09 
20288832    352.2     1235.49 
20288833    360.8     1226.28 
20288834    369.5     1217.42 
20288835    378.2     1208.91 
20288836    386.8     1200.70 
20288837    395.5     1192.79 
20288838    404.2     1185.15 
20288839    412.8     1177.77 
20288840    421.5     1170.64 
20288841    430.1     1163.72 
20288842    438.8     1157.03 
20288843    447.5     1150.53 
20288844    456.1     1144.23 
20288845    464.8     1138.11 
20288846    473.4     1132.16 
20288847    482.1     1126.38 
20288848    490.8     1120.75 
20288849    499.4     1115.27 
20288850    508.1     1109.93 
20288851    516.8     1104.72 
20288852    525.4     1099.64 
20288853    534.1     1094.69 
20288854    542.7     1089.85 
20288855    551.4     1085.12 
20288856    560.1     1080.51 
20288857    568.7     1075.99 
20288858    577.4     1071.58 
20288859    586.0     1067.26 
20288860    594.7     1063.03 
20288861    603.4     1058.89 
20288862    612.0     1054.83 
20288863    620.7     1050.86 
20288864    629.3     1046.96 
20288865    638.0     1043.14 
20288866    646.7     1039.40 
20288867    655.3     1035.72 
20288868    664.0     1032.11 
20288869    672.7     1028.57 
20288870    681.3     1025.09 
20288871    690.0     1021.68 
20288872    698.6     1018.32 
20288873    707.3     1015.02 
20288874    716.0     1011.78 
20288875    724.6     1008.59 
20288876    733.3     1005.46 
20288877    741.9     1002.37 
20288878    750.6     999.34 
20288879    759.3     996.35 
20288880    767.9     993.41 
20288881    776.6     990.51 
20288882    785.3     987.66 
20288883    793.9     984.86 
20288884    802.6     982.09 
20288885    811.2     979.36 
20288886    819.9     976.68 
20288887    828.6     974.03 
20288888    837.2     971.42 
20288889    845.9     968.85 
20288890    854.5     966.31 
20288891    863.2     963.81 
20288892    871.9     961.34 
20288893    880.5     958.90 
20288894    889.2     956.50 
20288895    897.9     954.13 
20288896    906.5     951.79 
20288897    915.2     949.48 
20288898    923.8     947.19 
20288899    932.5     944.94 
$ potenza ottenuta moltiplicando la potenza media del core (17.86 kW/m) per la l'altezza totale della fuel rod (3.658 m) basandosi sui dati del Kazimi $
$ 100 secondi è il tempo finale della simulazione $
*
*
*
*||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
*|||||||||||||||||||||||||||      CONTROLVAR      |||||||||||||||||||||||||||||
*||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
*
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$  CONTROLVAR  110 Pipe Exchanged Power [kW]                                  $
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
*
*crdno      Name     Type   Scalefactor   IV   IFlag   Limiter   Min/Max   Max
20510100   power_20     sum    1.e-3       0.     1
*crdno     A0   Ai        Vi
20510101   0.   1.   q   555010000
20510102        1.   q   555020000
20510103        1.   q   555030000
20510104        1.   q   555040000
20510105        1.   q   555050000
20510106        1.   q   555060000
20510107        1.   q   555070000
20510108        1.   q   555080000
20510109        1.   q   555090000
20510110        1.   q   555100000
20510111        1.   q   555110000
20510112        1.   q   555120000
20510113        1.   q   555130000
20510114        1.   q   555140000
20510115        1.   q   555150000
20510116        1.   q   555160000
20510117        1.   q   555170000
20510118        1.   q   555180000
20510119        1.   q   555190000
20510120        1.   q   555200000
*
*crdno      Name     Type   Scalefactor   IV   IFlag   Limiter   Min/Max   Max
20510200   power_40     sum    1.e-3       0.     1
*crdno     A0   Ai        Vi
20510201   0.   1.   q   555210000
20510202        1.   q   555220000
20510203        1.   q   555230000
20510204        1.   q   555240000
20510205        1.   q   555250000
20510206        1.   q   555260000
20510207        1.   q   555270000
20510208        1.   q   555280000
20510209        1.   q   555290000
20510210        1.   q   555300000
20510211        1.   q   555310000
20510212        1.   q   555320000
20510213        1.   q   555330000
20510214        1.   q   555340000
20510215        1.   q   555350000
20510216        1.   q   555360000
20510217        1.   q   555370000
20510218        1.   q   555380000
20510219        1.   q   555390000
20510220        1.   q   555400000
*
*crdno      Name     Type   Scalefactor   IV   IFlag   Limiter   Min/Max   Max
20510300   power_50     sum    1.e-3       0.     1
*crdno     A0   Ai        Vi
20510301   0.   1.   q   555410000
20510302        1.   q   555420000
20510303        1.   q   555430000
20510304        1.   q   555440000
20510305        1.   q   555450000
20510306        1.   q   555460000
20510307        1.   q   555470000
20510308        1.   q   555480000
20510309        1.   q   555490000
20510310        1.   q   555500000
*
*crdno      Name     Type   Scalefactor   IV   IFlag   Limiter   Min/Max   Max
20511000   power     sum       1.       0.     1
*crdno     A0   Ai           Vi
20511001   0.   1.   cntrlvar 101
20511002        1.   cntrlvar 102
20511003        1.   cntrlvar 103
*
*
*
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$  CONTROLVAR  120  Pressure drop [bar]                                       $
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
*
*crdno      Name    Type   Scalefactor   IV   IFlag   Limiter   Min/Max   Max
20512000     dp      sum      1.0e-5      0.    1
*                                                      *Between extreme volumes
*crdno     A0   Ai        Vi
20512001   0.   1.   p   555010000   *Inlet
20512002       -1.   p   555500000   *Outlet
*
*
*
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$  CONTROLVAR  130  CHF (W-3 non uniform correlation) [bar]                   $
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
*
*crdno      Name    Type   Scalefactor   IV   IFlag   Limiter   Min/Max   Max
20512000     dp      sum      1.0e-5      0.    1
*                                                      *Between extreme volumes
*crdno     A0   Ai        Vi
20512001   0.   1.   p   555010000   *Inlet
20512002       -1.   p   555500000   *Outlet
*
*
*
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$                        REQUESTED VARIABLES TO RSTPLT                        $
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
*
* Heat transfer mode
20800001 htmode 555000101
20800002 htmode 555002501
20800003 htmode 555005001
*
* Temperature profile in rod
20800004 httemp 555002501
20800005 httemp 555002502
20800006 httemp 555002503
20800007 httemp 555002504
20800008 httemp 555002505
20800009 httemp 555002506
20800010 httemp 555002507
20800011 httemp 555002508
20800012 httemp 555002509
20800013 httemp 555002510
*
* Temperature max cladding
20800014 httemp 555000108
20800015 httemp 555002508
20800016 httemp 555005008
*
* Axial profile heat transfer mode
20800101 htmode 555000101
20800102 htmode 555000201
20800103 htmode 555000301
20800104 htmode 555000401
20800105 htmode 555000501
20800106 htmode 555000601
20800107 htmode 555000701
20800108 htmode 555000801
20800109 htmode 555000901
20800110 htmode 555001001
20800111 htmode 555001101
20800112 htmode 555001201
20800113 htmode 555001301
20800114 htmode 555001401
20800115 htmode 555001501
20800116 htmode 555001601
20800117 htmode 555001701
20800118 htmode 555001801
20800119 htmode 555001901
20800120 htmode 555002001
20800121 htmode 555002101
20800122 htmode 555002201
20800123 htmode 555002301
20800124 htmode 555002401
20800125 htmode 555002501
20800126 htmode 555002601
20800127 htmode 555002701
20800128 htmode 555002801
20800129 htmode 555002901
20800130 htmode 555003001
20800131 htmode 555003101
20800132 htmode 555003201
20800133 htmode 555003301
20800134 htmode 555003401
20800135 htmode 555003501
20800136 htmode 555003601
20800137 htmode 555003701
20800138 htmode 555003801
20800139 htmode 555003901
20800140 htmode 555004001
20800141 htmode 555004101
20800142 htmode 555004201
20800143 htmode 555004301
20800144 htmode 555004401
20800145 htmode 555004501
20800146 htmode 555004601
20800147 htmode 555004701
20800148 htmode 555004801
20800149 htmode 555004901
20800150 htmode 555005001
*
* Axial profile max clad temp
20800201 httemp 555000108
20800202 httemp 555000208
20800203 httemp 555000308
20800204 httemp 555000408
20800205 httemp 555000508
20800206 httemp 555000608
20800207 httemp 555000708
20800208 httemp 555000808
20800209 httemp 555000908
20800210 httemp 555001008
20800211 httemp 555001108
20800212 httemp 555001208
20800213 httemp 555001308
20800214 httemp 555001408
20800215 httemp 555001508
20800216 httemp 555001608
20800217 httemp 555001708
20800218 httemp 555001808
20800219 httemp 555001908
20800220 httemp 555002008
20800221 httemp 555002108
20800222 httemp 555002208
20800223 httemp 555002308
20800224 httemp 555002408
20800225 httemp 555002508
20800226 httemp 555002608
20800227 httemp 555002708
20800228 httemp 555002808
20800229 httemp 555002908
20800230 httemp 555003008
20800231 httemp 555003108
20800232 httemp 555003208
20800233 httemp 555003308
20800234 httemp 555003408
20800235 httemp 555003508
20800236 httemp 555003608
20800237 httemp 555003708
20800238 httemp 555003808
20800239 httemp 555003908
20800240 httemp 555004008
20800241 httemp 555004108
20800242 httemp 555004208
20800243 httemp 555004308
20800244 httemp 555004408
20800245 httemp 555004508
20800246 httemp 555004608
20800247 httemp 555004708
20800248 httemp 555004808
20800249 httemp 555004908
20800250 httemp 555005008
*
* Axial profile h_f (enthalpy of fluid at saturation conditions)
20800301 sathf 555010000
20800302 sathf 555020000
20800303 sathf 555030000
20800304 sathf 555040000
20800305 sathf 555050000
20800306 sathf 555060000
20800307 sathf 555070000
20800308 sathf 555080000
20800309 sathf 555090000
20800310 sathf 555100000
20800311 sathf 555110000
20800312 sathf 555120000
20800313 sathf 555130000
20800314 sathf 555140000
20800315 sathf 555150000
20800316 sathf 555160000
20800317 sathf 555170000
20800318 sathf 555180000
20800319 sathf 555190000
20800320 sathf 555200000
20800321 sathf 555210000
20800322 sathf 555220000
20800323 sathf 555230000
20800324 sathf 555240000
20800325 sathf 555250000
20800326 sathf 555260000
20800327 sathf 555270000
20800328 sathf 555280000
20800329 sathf 555290000
20800330 sathf 555300000
20800331 sathf 555310000
20800332 sathf 555320000
20800333 sathf 555330000
20800334 sathf 555340000
20800335 sathf 555350000
20800336 sathf 555360000
20800337 sathf 555370000
20800338 sathf 555380000
20800339 sathf 555390000
20800340 sathf 555400000
20800341 sathf 555410000
20800342 sathf 555420000
20800343 sathf 555430000
20800344 sathf 555440000
20800345 sathf 555450000
20800346 sathf 555460000
20800347 sathf 555470000
20800348 sathf 555480000
20800349 sathf 555490000
20800350 sathf 555500000
.
