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
201        1.        1e-8      0.001     00003   500      500     500
*
*crdno   Endtime[s] Mindt[s]  Maxdt[s]   ctrl  Minedit  Majedit   Rst
202        10.       1e-8      0.01     00003    50       50      50
*
*crdno   Endtime[s] Mindt[s]  Maxdt[s]   ctrl  Minedit  Majedit   Rst
203        100.      1e-8      0.05     00003   10        10      10
*
204     276.5     1e-8   0.05   00003   10    10    10 
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
*
*
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
1000201     0.      1.551e+7    566.25
1000202   100.      1.551e+7    566.25
1000202  100.0   1.55100e+07   566.25 
1000203  101.5   1.44037e+07   566.11 
1000204  103.0   1.33779e+07   565.98 
1000205  104.5   1.24267e+07   565.85 
1000206  106.0   1.15446e+07   565.73 
1000207  107.6   1.07268e+07   565.61 
1000208  109.1   9.96838e+06   565.49 
1000209  110.6   9.26515e+06   565.39 
1000210  112.1   8.61307e+06   565.28 
1000211  113.6   8.00843e+06   565.18 
1000212  115.1   7.44776e+06   563.21 
1000213  116.6   6.92787e+06   558.28 
1000214  118.1   6.44579e+06   553.45 
1000215  119.6   5.99878e+06   548.72 
1000216  121.1   5.58428e+06   544.09 
1000217  122.7   5.19993e+06   539.55 
1000218  124.2   4.84354e+06   535.11 
1000219  125.7   4.51306e+06   530.77 
1000220  127.2   4.20663e+06   526.51 
1000221  128.7   3.92248e+06   522.35 
1000222  130.2   3.65900e+06   518.28 
1000223  131.7   3.41469e+06   514.30 
1000224  133.2   3.18814e+06   510.41 
1000225  134.7   2.97807e+06   506.60 
1000226  136.2   2.78328e+06   502.89 
1000227  137.8   2.60266e+06   499.26 
1000228  139.3   2.43518e+06   495.71 
1000229  140.8   2.27988e+06   492.26 
1000230  142.3   2.13587e+06   488.88 
1000231  143.8   2.00234e+06   485.59 
1000232  145.3   1.87852e+06   482.39 
1000233  146.8   1.76371e+06   479.27 
1000234  148.3   1.65725e+06   476.23 
1000235  149.8   1.55853e+06   473.27 
1000236  151.4   1.46699e+06   470.39 
1000237  152.9   1.38211e+06   467.60 
1000238  154.4   1.30340e+06   464.88 
1000239  155.9   1.23042e+06   462.25 
1000240  157.4   1.16275e+06   459.69 
1000241  158.9   1.09999e+06   457.22 
1000242  160.4   1.04181e+06   454.82 
1000243  161.9   9.87852e+05   452.51 
1000244  163.4   9.37822e+05   450.26 
1000245  164.9   8.91430e+05   448.10 
1000246  166.5   8.48413e+05   446.01 
1000247  168.0   8.08524e+05   444.00 
1000248  169.5   7.71537e+05   442.07 
1000249  171.0   7.37240e+05   440.20 
1000250  172.5   7.05437e+05   438.42 
1000251  174.0   6.75948e+05   436.70 
1000252  175.5   6.48604e+05   435.05 
1000253  177.0   6.23248e+05   433.47 
1000254  178.5   5.99737e+05   431.97 
1000255  180.0   5.77935e+05   430.52 
1000256  181.6   5.57720e+05   429.15 
1000257  183.1   5.38975e+05   427.84 
1000258  184.6   5.21593e+05   426.59 
1000259  186.1   5.05476e+05   425.40 
1000260  187.6   4.90530e+05   424.27 
1000261  189.1   4.76672e+05   423.19 
1000262  190.6   4.63822e+05   422.18 
1000263  192.1   4.51906e+05   421.21 
1000264  193.6   4.40858e+05   420.30 
1000265  195.1   4.30612e+05   419.44 
1000266  196.7   4.21112e+05   418.63 
1000267  198.2   4.12303e+05   417.86 
1000268  199.7   4.04135e+05   417.13 
1000269  201.2   3.96561e+05   416.45 
1000270  202.7   3.89537e+05   415.81 
1000271  204.2   3.83025e+05   415.21 
1000272  205.7   3.76986e+05   414.64 
1000273  207.2   3.71387e+05   414.11 
1000274  208.7   3.66194e+05   413.61 
1000275  210.3   3.61380e+05   413.14 
1000276  211.8   3.56915e+05   412.70 
1000277  213.3   3.52776e+05   412.29 
1000278  214.8   3.48937e+05   411.90 
1000279  216.3   3.45378e+05   411.54 
1000280  217.8   3.42077e+05   411.21 
1000281  219.3   3.39017e+05   410.89 
1000282  220.8   3.36179e+05   410.60 
1000283  222.3   3.33547e+05   410.33 
1000284  223.8   3.31107e+05   410.07 
1000285  225.4   3.28845e+05   409.83 
1000286  226.9   3.26747e+05   409.61 
1000287  228.4   3.24801e+05   409.40 
1000288  229.9   3.22997e+05   409.21 
1000289  231.4   3.21325e+05   409.03 
1000290  232.9   3.19774e+05   408.87 
1000291  234.4   3.18335e+05   408.71 
1000292  235.9   3.17002e+05   408.57 
1000293  237.4   3.15765e+05   408.43 
1000294  238.9   3.14618e+05   408.31 
1000295  240.5   3.13555e+05   408.19 
1000296  242.0   3.12569e+05   408.08 
1000297  243.5   3.11655e+05   407.98 
1000298  245.0   3.10807e+05   407.89 
1000299  246.5   3.10021e+05   407.80 
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
2000201     0.      1.5313e+7    566.25
2000202   100.      1.5313e+7    566.25
2000202  100.0   1.53130e+07   566.25 
2000203  101.5   1.42067e+07   566.25 
2000204  103.0   1.31809e+07   566.25 
2000205  104.5   1.22297e+07   566.25 
2000206  106.0   1.13476e+07   566.25 
2000207  107.6   1.05298e+07   566.25 
2000208  109.1   9.77138e+06   566.25 
2000209  110.6   9.06815e+06   566.25 
2000210  112.1   8.41607e+06   566.25 
2000211  113.6   7.81143e+06   566.25 
2000212  115.1   7.25076e+06   566.25 
2000213  116.6   6.73087e+06   566.25 
2000214  118.1   6.24879e+06   566.25 
2000215  119.6   5.80178e+06   566.25 
2000216  121.1   5.38728e+06   566.25 
2000217  122.7   5.00293e+06   566.25 
2000218  124.2   4.64654e+06   566.25 
2000219  125.7   4.31606e+06   566.25 
2000220  127.2   4.00963e+06   566.25 
2000221  128.7   3.72548e+06   566.25 
2000222  130.2   3.46200e+06   566.25 
2000223  131.7   3.21769e+06   566.25 
2000224  133.2   2.99114e+06   566.25 
2000225  134.7   2.78107e+06   566.25 
2000226  136.2   2.58628e+06   566.25 
2000227  137.8   2.40566e+06   566.25 
2000228  139.3   2.23818e+06   566.25 
2000229  140.8   2.08288e+06   566.25 
2000230  142.3   1.93887e+06   566.25 
2000231  143.8   1.80534e+06   566.25 
2000232  145.3   1.68152e+06   566.25 
2000233  146.8   1.56671e+06   566.25 
2000234  148.3   1.46025e+06   566.25 
2000235  149.8   1.36153e+06   566.25 
2000236  151.4   1.26999e+06   566.25 
2000237  152.9   1.18511e+06   566.25 
2000238  154.4   1.10640e+06   566.25 
2000239  155.9   1.03342e+06   566.25 
2000240  157.4   9.65746e+05   566.25 
2000241  158.9   9.02995e+05   566.25 
2000242  160.4   8.44808e+05   566.25 
2000243  161.9   7.90852e+05   566.25 
2000244  163.4   7.40822e+05   566.25 
2000245  164.9   6.94430e+05   566.25 
2000246  166.5   6.51413e+05   566.25 
2000247  168.0   6.11524e+05   566.25 
2000248  169.5   5.74537e+05   566.25 
2000249  171.0   5.40240e+05   566.25 
2000250  172.5   5.08437e+05   566.25 
2000251  174.0   4.78948e+05   566.25 
2000252  175.5   4.51604e+05   566.25 
2000253  177.0   4.26248e+05   566.25 
2000254  178.5   4.02737e+05   566.25 
2000255  180.0   3.80935e+05   566.25 
2000256  181.6   3.60720e+05   566.25 
2000257  183.1   3.41975e+05   566.25 
2000258  184.6   3.24593e+05   566.25 
2000259  186.1   3.08476e+05   566.25 
2000260  187.6   2.93530e+05   566.25 
2000261  189.1   2.79672e+05   566.25 
2000262  190.6   2.66822e+05   566.25 
2000263  192.1   2.54906e+05   566.25 
2000264  193.6   2.43858e+05   566.25 
2000265  195.1   2.33612e+05   566.25 
2000266  196.7   2.24112e+05   566.25 
2000267  198.2   2.15303e+05   566.25 
2000268  199.7   2.07135e+05   566.25 
2000269  201.2   1.99561e+05   566.25 
2000270  202.7   1.92537e+05   566.25 
2000271  204.2   1.86025e+05   566.25 
2000272  205.7   1.79986e+05   566.25 
2000273  207.2   1.74387e+05   566.25 
2000274  208.7   1.69194e+05   566.25 
2000275  210.3   1.64380e+05   566.25 
2000276  211.8   1.59915e+05   566.25 
2000277  213.3   1.55776e+05   566.25 
2000278  214.8   1.51937e+05   566.25 
2000279  216.3   1.48378e+05   566.25 
2000280  217.8   1.45077e+05   566.25 
2000281  219.3   1.42017e+05   566.25 
2000282  220.8   1.39179e+05   566.25 
2000283  222.3   1.36547e+05   566.25 
2000284  223.8   1.34107e+05   566.25 
2000285  225.4   1.31845e+05   566.25 
2000286  226.9   1.29747e+05   566.25 
2000287  228.4   1.27801e+05   566.25 
2000288  229.9   1.25997e+05   566.25 
2000289  231.4   1.24325e+05   566.25 
2000290  232.9   1.22774e+05   566.25 
2000291  234.4   1.21335e+05   566.25 
2000292  235.9   1.20002e+05   566.25 
2000293  237.4   1.18765e+05   566.25 
2000294  238.9   1.17618e+05   566.25 
2000295  240.5   1.16555e+05   566.25 
2000296  242.0   1.15569e+05   566.25 
2000297  243.5   1.14655e+05   566.25 
2000298  245.0   1.13807e+05   566.25 
2000299  246.5   1.13021e+05   566.25 
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
* URANIUM DIOXIDE
20111100  tbl/fctn   1   1
20111101  298.15  7.6121 326.65  7.2963 355.16  7.0027 383.66  6.7292
20111102  412.16  6.4738 440.67  6.2348 469.17  6.0107 497.67  5.8002
20111103  526.18  5.6021 554.68  5.4153 583.19  5.2390 611.69  5.0723
20111104  640.19  4.9144 668.70  4.7647 697.20  4.6227 725.70  4.4877
20111105  754.21  4.3592 782.71  4.2368 811.21  4.1201 839.72  4.0088
20111106  868.22  3.9024 896.72  3.8007 925.23  3.7033 953.73  3.6101
20111107  982.23  3.5208 1010.74  3.4352 1039.24  3.3531 1067.75  3.2743
20111108  1096.25  3.1987 1124.75  3.1261 1153.26  3.0565 1181.76  2.9896
20111109  1210.26  2.9254 1238.77  2.8638 1267.27  2.8048 1295.77  2.7483
20111110  1324.28  2.6942 1352.78  2.6424 1381.28  2.5930 1409.79  2.5460
20111111  1438.29  2.5012 1466.79  2.4587 1495.30  2.4184 1523.80  2.3803
20111112  1552.31  2.3445 1580.81  2.3108 1609.31  2.2793 1637.82  2.2501
20111113  1666.32  2.2229 1694.82  2.1980 1723.33  2.1751 1751.83  2.1544
20111114  1780.33  2.1359 1808.84  2.1194 1837.34  2.1050 1865.84  2.0926
20111115  1894.35  2.0823 1922.85  2.0740 1951.36  2.0676 1979.86  2.0633
20111116  2008.36  2.0608 2036.87  2.0602 2065.37  2.0615 2093.87  2.0646
20111117  2122.38  2.0695 2150.88  2.0761 2179.38  2.0844 2207.89  2.0944
20111118  2236.39  2.1059 2264.89  2.1190 2293.40  2.1337 2321.90  2.1498
20111119  2350.40  2.1673 2378.91  2.1861 2407.41  2.2063 2435.92  2.2278
20111120  2464.42  2.2504 2492.92  2.2742 2521.43  2.2992 2549.93  2.3251
20111121  2578.43  2.3521 2606.94  2.3801 2635.44  2.4090 2663.94  2.4387
20111122  2692.45  2.4692 2720.95  2.5005 2749.45  2.5325 2777.96  2.5652
20111123  2806.46  2.5985 2834.96  2.6323 2863.47  2.6667 2891.97  2.7016
20111124  2920.48  2.7369 2948.98  2.7727 2977.48  2.8087 3005.99  2.8452
20111125  3034.49  2.8819 3062.99  2.9188 3091.50  2.9560 3120.00  2.9933
20111151  3839500.  *[J/m^3/°K]
*
* GAP GAS
20122200  tbl/fctn  3   1       * gas mixture
20122201  helium  1.0
20122202  xenon   0.0
20122251  10.126  *[J/m^3/°K]
*
* ZIRCONIUM
20133300  tbl/fctn  2   1
20133301  298.   2000.    8.8527  7.082e-3   2.5329e-6  0.   0.  2.9918e+3  0.
20133352  2200000.   *[J/m^3/°K]
*
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
20288802    200.0     66351.88 
20288803    200.5     4610.20 
20288804    201.3     3790.57 
20288805    202.1     3433.04 
20288806    202.9     3210.72 
20288807    203.7     3052.07 
20288808    204.5     2930.04 
20288809    205.2     2831.60 
20288810    206.0     2749.55 
20288811    206.8     2679.49 
20288812    207.6     2618.55 
20288813    208.4     2564.77 
20288814    209.2     2516.74 
20288815    210.0     2473.43 
20288816    210.8     2434.06 
20288817    211.6     2398.00 
20288818    212.4     2364.79 
20288819    213.2     2334.03 
20288820    214.0     2305.42 
20288821    214.8     2278.69 
20288822    215.5     2253.63 
20288823    216.3     2230.05 
20288824    217.1     2207.81 
20288825    217.9     2186.77 
20288826    218.7     2166.82 
20288827    219.5     2147.85 
20288828    220.3     2129.79 
20288829    221.1     2112.56 
20288830    221.9     2096.08 
20288831    222.7     2080.30 
20288832    223.5     2065.17 
20288833    224.2     2050.65 
20288834    225.0     2036.68 
20288835    225.8     2023.23 
20288836    226.6     2010.27 
20288837    227.4     1997.76 
20288838    228.2     1985.67 
20288839    229.0     1973.99 
20288840    229.8     1962.69 
20288841    230.6     1951.73 
20288842    231.4     1941.12 
20288843    232.2     1930.82 
20288844    233.0     1920.82 
20288845    233.8     1911.10 
20288846    234.5     1901.66 
20288847    235.3     1892.47 
20288848    236.1     1883.52 
20288849    236.9     1874.81 
20288850    237.7     1866.32 
20288851    238.5     1858.04 
20288852    239.3     1849.96 
20288853    240.1     1842.07 
20288854    240.9     1834.37 
20288855    241.7     1826.85 
20288856    242.5     1819.49 
20288857    243.2     1812.30 
20288858    244.0     1805.26 
20288859    244.8     1798.38 
20288860    245.6     1791.64 
20288861    246.4     1785.04 
20288862    247.2     1778.57 
20288863    248.0     1772.23 
20288864    248.8     1766.01 
20288865    249.6     1759.92 
20288866    250.4     1753.94 
20288867    251.2     1748.07 
20288868    252.0     1742.31 
20288869    252.8     1736.65 
20288870    253.5     1731.10 
20288871    254.3     1725.64 
20288872    255.1     1720.28 
20288873    255.9     1715.01 
20288874    256.7     1709.83 
20288875    257.5     1704.73 
20288876    258.3     1699.72 
20288877    259.1     1694.79 
20288878    259.9     1689.93 
20288879    260.7     1685.16 
20288880    261.5     1680.46 
20288881    262.2     1675.83 
20288882    263.0     1671.27 
20288883    263.8     1666.77 
20288884    264.6     1662.35 
20288885    265.4     1657.99 
20288886    266.2     1653.69 
20288887    267.0     1649.45 
20288888    267.8     1645.28 
20288889    268.6     1641.16 
20288890    269.4     1637.10 
20288891    270.2     1633.09 
20288892    271.0     1629.14 
20288893    271.8     1625.24 
20288894    272.5     1621.39 
20288895    273.3     1617.59 
20288896    274.1     1613.84 
20288897    274.9     1610.13 
20288898    275.7     1606.48 
20288899    276.5     1602.87 
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
