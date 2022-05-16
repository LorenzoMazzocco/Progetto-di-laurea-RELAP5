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
201        1.        1e-8      0.001     00003   500      500      50
*
*crdno   Endtime[s] Mindt[s]  Maxdt[s]   ctrl  Minedit  Majedit   Rst
202        10.       1e-8      0.01     00003    50       50       5
*
*crdno   Endtime[s] Mindt[s]  Maxdt[s]   ctrl  Minedit  Majedit   Rst
203        100.      1e-8      0.05     00003   10        10       1
*
* (201 writes every 0.05 s)
* (202 writes every 0.05 s)
* (203 writes every 0.05 s)
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
20111101  298.15  7.9927 326.65  7.6611 355.16  7.3529 383.66  7.0657
20111102  412.16  6.7975 440.67  6.5466 469.17  6.3113 497.67  6.0902
20111103  526.18  5.8822 554.68  5.6861 583.19  5.5009 611.69  5.3259
20111104  640.19  5.1601 668.70  5.0030 697.20  4.8538 725.70  4.7120
20111105  754.21  4.5771 782.71  4.4487 811.21  4.3261 839.72  4.2092
20111106  868.22  4.0975 896.72  3.9907 925.23  3.8885 953.73  3.7907
20111107  982.23  3.6969 1010.74  3.6070 1039.24  3.5208 1067.75  3.4381
20111108  1096.25  3.3587 1124.75  3.2824 1153.26  3.2093 1181.76  3.1390
20111109  1210.26  3.0717 1238.77  3.0070 1267.27  2.9450 1295.77  2.8857
20111110  1324.28  2.8289 1352.78  2.7746 1381.28  2.7227 1409.79  2.6733
20111111  1438.29  2.6262 1466.79  2.5816 1495.30  2.5393 1523.80  2.4993
20111112  1552.31  2.4617 1580.81  2.4263 1609.31  2.3933 1637.82  2.3626
20111113  1666.32  2.3341 1694.82  2.3079 1723.33  2.2839 1751.83  2.2622
20111114  1780.33  2.2426 1808.84  2.2253 1837.34  2.2102 1865.84  2.1972
20111115  1894.35  2.1864 1922.85  2.1777 1951.36  2.1710 1979.86  2.1664
20111116  2008.36  2.1638 2036.87  2.1632 2065.37  2.1646 2093.87  2.1678
20111117  2122.38  2.1730 2150.88  2.1799 2179.38  2.1886 2207.89  2.1991
20111118  2236.39  2.2112 2264.89  2.2250 2293.40  2.2404 2321.90  2.2572
20111119  2350.40  2.2756 2378.91  2.2954 2407.41  2.3166 2435.92  2.3391
20111120  2464.42  2.3629 2492.92  2.3879 2521.43  2.4141 2549.93  2.4414
20111121  2578.43  2.4697 2606.94  2.4991 2635.44  2.5294 2663.94  2.5606
20111122  2692.45  2.5927 2720.95  2.6255 2749.45  2.6591 2777.96  2.6934
20111123  2806.46  2.7284 2834.96  2.7639 2863.47  2.8001 2891.97  2.8367
20111124  2920.48  2.8738 2948.98  2.9113 2977.48  2.9492 3005.99  2.9874
20111125  3034.49  3.0260 3062.99  3.0647 3091.50  3.1038 3120.00  3.1430
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
*
*
.
