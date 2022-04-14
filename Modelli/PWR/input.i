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
50       new      transnt
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
201        1.        1.e-8     0.001     00003   500      500     500
*
*crdno   Endtime[s] Mindt[s]  Maxdt[s]   ctrl  Minedit  Majedit   Rst
202        10.       1.e-8     0.01     00003    50       50      50
*
*crdno   Endtime[s] Mindt[s]  Maxdt[s]   ctrl  Minedit  Majedit   Rst
203        50.      1.e-8     0.05     00003   10        10      10
*
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
$                        COMPONENT 50 - LOWER RESERVOIR                      $
$                                                                             $
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
*
*crdno       Name        Type
500000     l_tank    tmdpvol
*
*crdno    Volflowarea[m^2]   Vollength[m]   Volvolume[m^3]
500101       1.e+5               1.             0.
*
*crdno    Azangle   Vertangle   Elevchange[m]
500102      0.        90.          1.
*
*crdno   Rough[m]  Dhyd[m]    Control Flags
500103      0.       0.           0000000
*
*--------------------------- VOLUME DATA ----------------------------
*
*crdno   ebt   W2   W3
500200  003
*
*crdno   Time[s]      P[Pa]      T[K]
*
500201     0.      15.51e+6    566.25
500202   50.      15.51e+6    566.25
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
150000   feedin   tmdpjun
*
*crdno       From        To      Junarea[m^2]
150101   50000000   55505001      0.
*
*--------------------------- JUNCTION DATA ----------------------------
*
*crdno    Controlword    W2   W3   W4
150200       1 *  (0 = velocity ; 1 = mass flow rate)
*
*crdno    Time[s]   Ml[kg/s]   Mv[kg/s]   Vint[m/s]
*
150201      0.        ???         0.          0.
150202    50.        ???         0.          0.
*
*----------------------------------------------------------------------
*
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$                                                                             $
$                      COMPONENT 555 - HEATED CHANNEL   VA CAMBIATA LA FORMA!!!                      $
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
5550101    8.79E-5         50
*
*crdno Junctionflowarea[m^2]  Junno
5550201        0.               49
*
*crdno    Vollength[m]   Volno
5550301     7.752E-2      50
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
5550801   1.52e-6    4.3816E-3   50
*
*crdno   Forloss  Revloss  Junno
5550901    0.      0.       49
*
*crdno   Volume Control Flags   Volno
555501        0000000           50
*
*
*crdno   Junction Control Flags   Junno
5551101        000500             49
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
*crdno     Name      Type
2000000   u_tank    snglvol
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
*crdno    P[Pa]     T[K]
500201  1.0e+6    293.15
*------------------------------------------------------------------------------
*
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$                                                                             $
$                      COMPONENT 210 - OUTLET JUNCTION                        $
$                                                                             $
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
*
*crdno     Name     Type
250000   outlet   sngljun
*
*crdno       From        To      Junarea[m^2]
250101   555??0002   200000000      0.
*
*crdno     Area[m^2]    Loss K fwd    Loss K bwd
250102       0.             0.           0.
*
*--------------------------- JUNCTION IC ----------------------------
*
*crdno    Controlword
250201        1    *(0 = velocity; 1 = mass)
*
*crdno     Ml[kg/s]      Mv[kg/s]      Vint[m/s]
250202      0.             0.            0.
*
*------------------------------------------------------------------------------
*