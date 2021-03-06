* SPICE NETLIST
***************************************

.SUBCKT L POS NEG SUB
.ENDS
***************************************
.SUBCKT BUFFER Vpcas Vb2 Vi+ Vi- Vb3 Vncas Vb1 Vb4 AVdd AGnd Vo
** N=63 EP=11 IP=0 FDC=244
C0 39 Vo L=1.3e-05 W=6.5e-06 $[MIMCAPS_MM] $X=12360 $Y=16440 $D=64
C1 38 Vo L=1.3e-05 W=6.5e-06 $[MIMCAPS_MM] $X=12360 $Y=24990 $D=64
C2 39 Vo L=1.3e-05 W=6.5e-06 $[MIMCAPS_MM] $X=12360 $Y=33540 $D=64
C3 39 Vo L=1.3e-05 W=6.5e-06 $[MIMCAPS_MM] $X=12360 $Y=42090 $D=64
C4 38 Vo L=1.3e-05 W=6.5e-06 $[MIMCAPS_MM] $X=12360 $Y=50640 $D=64
C5 39 Vo L=1.3e-05 W=6.5e-06 $[MIMCAPS_MM] $X=12360 $Y=59190 $D=64
C6 38 Vo L=1.3e-05 W=6.5e-06 $[MIMCAPS_MM] $X=101340 $Y=16550 $D=64
C7 39 Vo L=1.3e-05 W=6.5e-06 $[MIMCAPS_MM] $X=101340 $Y=25100 $D=64
C8 38 Vo L=1.3e-05 W=6.5e-06 $[MIMCAPS_MM] $X=101340 $Y=33650 $D=64
C9 38 Vo L=1.3e-05 W=6.5e-06 $[MIMCAPS_MM] $X=101340 $Y=42200 $D=64
C10 39 Vo L=1.3e-05 W=6.5e-06 $[MIMCAPS_MM] $X=101340 $Y=50750 $D=64
C11 38 Vo L=1.3e-05 W=6.5e-06 $[MIMCAPS_MM] $X=101340 $Y=59300 $D=64
R12 38 1 wr=2e-06 lr=1e-05 $SUB=AVdd $[RNHR1000_MM] $X=33090 $Y=24010 $D=45
R13 5 39 wr=2e-06 lr=1e-05 $SUB=AVdd $[RNHR1000_MM] $X=33090 $Y=39690 $D=45
R14 39 5 wr=2e-06 lr=1e-05 $SUB=AVdd $[RNHR1000_MM] $X=91510 $Y=24120 $D=45
R15 1 38 wr=2e-06 lr=1e-05 $SUB=AVdd $[RNHR1000_MM] $X=91510 $Y=39800 $D=45
M16 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=31930 $Y=74480 $D=3
M17 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=31930 $Y=77860 $D=3
M18 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=32920 $Y=74480 $D=3
M19 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=32920 $Y=77860 $D=3
M20 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=33910 $Y=74480 $D=3
M21 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=33910 $Y=77860 $D=3
M22 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=34900 $Y=74480 $D=3
M23 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=34900 $Y=77860 $D=3
M24 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=35890 $Y=74480 $D=3
M25 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=35890 $Y=77860 $D=3
M26 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=36880 $Y=74480 $D=3
M27 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=36880 $Y=77860 $D=3
M28 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=37870 $Y=74480 $D=3
M29 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=37870 $Y=77860 $D=3
M30 1 2 1 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=38800 $Y=57150 $D=3
M31 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=38860 $Y=74480 $D=3
M32 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=38860 $Y=77860 $D=3
M33 5 Vpcas 1 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=39790 $Y=57150 $D=3
M34 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=39850 $Y=74480 $D=3
M35 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=39850 $Y=77860 $D=3
M36 5 4 5 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=40780 $Y=57150 $D=3
M37 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=40840 $Y=74480 $D=3
M38 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=40840 $Y=77860 $D=3
M39 12 6 12 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=43070 $Y=57150 $D=3
M40 18 Vpcas 12 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=44060 $Y=57150 $D=3
M41 18 7 18 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=45050 $Y=57150 $D=3
M42 55 Vb2 1 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=1.225e-12 PD=3.48e-06 PS=3.48e-06 $X=50230 $Y=65810 $D=3
M43 56 Vb2 12 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=1.225e-12 PD=3.48e-06 PS=3.48e-06 $X=50230 $Y=70410 $D=3
M44 56 9 56 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=52140 $Y=76680 $D=3
M45 56 Vb2 12 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=52520 $Y=65810 $D=3
M46 55 Vb2 1 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=52520 $Y=70410 $D=3
M47 61 Vi+ 59 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=52770 $Y=39370 $D=3
M48 61 Vi- 58 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=52770 $Y=44250 $D=3
M49 61 Vi- 58 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=52770 $Y=49500 $D=3
M50 61 Vi+ 59 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=52770 $Y=54380 $D=3
M51 AVdd 12 56 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=53130 $Y=76680 $D=3
M52 12 Vb2 56 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=53510 $Y=65810 $D=3
M53 1 Vb2 55 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=53510 $Y=70410 $D=3
M54 58 Vi- 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=53760 $Y=39370 $D=3
M55 59 Vi+ 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=53760 $Y=44250 $D=3
M56 59 Vi+ 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=53760 $Y=49500 $D=3
M57 58 Vi- 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=53760 $Y=54380 $D=3
M58 55 12 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=54120 $Y=76680 $D=3
M59 61 Vi- 58 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=54750 $Y=39370 $D=3
M60 61 Vi+ 59 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=54750 $Y=44250 $D=3
M61 61 Vi+ 59 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=54750 $Y=49500 $D=3
M62 61 Vi- 58 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=54750 $Y=54380 $D=3
M63 AVdd 12 55 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=55110 $Y=76680 $D=3
M64 59 Vi+ 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=55740 $Y=39370 $D=3
M65 58 Vi- 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=55740 $Y=44250 $D=3
M66 58 Vi- 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=55740 $Y=49500 $D=3
M67 59 Vi+ 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=55740 $Y=54380 $D=3
M68 1 Vb2 55 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=1.225e-12 PD=3.48e-06 PS=3.48e-06 $X=55800 $Y=65810 $D=3
M69 12 Vb2 56 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=1.225e-12 PD=3.48e-06 PS=3.48e-06 $X=55800 $Y=70410 $D=3
M70 56 12 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=56100 $Y=76680 $D=3
M71 56 16 56 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=57090 $Y=76680 $D=3
M72 19 19 61 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=3.92e-12 PD=5.4e-07 PS=8.98e-06 $X=58470 $Y=39390 $D=3
M73 19 19 61 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=3.92e-12 PD=5.4e-07 PS=8.98e-06 $X=58470 $Y=48880 $D=3
M74 62 Vb1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=59380 $Y=76680 $D=3
M75 61 Vb2 62 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=59450 $Y=68130 $D=3
M76 61 19 19 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=2.16e-12 PD=5.4e-07 PS=5.4e-07 $X=59460 $Y=39390 $D=3
M77 61 19 19 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=2.16e-12 PD=5.4e-07 PS=5.4e-07 $X=59460 $Y=48880 $D=3
M78 AVdd Vb1 62 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=60370 $Y=76680 $D=3
M79 62 Vb2 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=60440 $Y=68130 $D=3
M80 19 19 61 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=2.16e-12 PD=5.4e-07 PS=5.4e-07 $X=60450 $Y=39390 $D=3
M81 19 19 61 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=2.16e-12 PD=5.4e-07 PS=5.4e-07 $X=60450 $Y=48880 $D=3
M82 62 Vb1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=61360 $Y=76680 $D=3
M83 61 Vb2 62 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=61430 $Y=68130 $D=3
M84 61 19 19 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=2.16e-12 PD=5.4e-07 PS=5.4e-07 $X=61440 $Y=39390 $D=3
M85 61 19 19 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=2.16e-12 PD=5.4e-07 PS=5.4e-07 $X=61440 $Y=48880 $D=3
M86 AVdd Vb1 62 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=62350 $Y=76680 $D=3
M87 62 Vb2 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=62420 $Y=68130 $D=3
M88 19 19 61 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=2.16e-12 PD=5.4e-07 PS=5.4e-07 $X=62430 $Y=39390 $D=3
M89 19 19 61 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=2.16e-12 PD=5.4e-07 PS=5.4e-07 $X=62430 $Y=48880 $D=3
M90 62 Vb1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=63340 $Y=76680 $D=3
M91 61 Vb2 62 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=63410 $Y=68130 $D=3
M92 61 19 19 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=2.16e-12 PD=5.4e-07 PS=5.4e-07 $X=63420 $Y=39390 $D=3
M93 61 19 19 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=2.16e-12 PD=5.4e-07 PS=5.4e-07 $X=63420 $Y=48880 $D=3
M94 AVdd Vb1 62 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=64330 $Y=76680 $D=3
M95 62 Vb2 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=64400 $Y=68130 $D=3
M96 19 19 61 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=2.16e-12 PD=5.4e-07 PS=5.4e-07 $X=64410 $Y=39390 $D=3
M97 19 19 61 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=2.16e-12 PD=5.4e-07 PS=5.4e-07 $X=64410 $Y=48880 $D=3
M98 62 Vb1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=65320 $Y=76680 $D=3
M99 61 Vb2 62 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=65390 $Y=68130 $D=3
M100 61 19 19 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=2.16e-12 PD=5.4e-07 PS=5.4e-07 $X=65400 $Y=39390 $D=3
M101 61 19 19 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=2.16e-12 PD=5.4e-07 PS=5.4e-07 $X=65400 $Y=48880 $D=3
M102 AVdd Vb1 62 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=66310 $Y=76680 $D=3
M103 62 Vb2 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=66380 $Y=68130 $D=3
M104 19 19 61 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=2.16e-12 PD=5.4e-07 PS=5.4e-07 $X=66390 $Y=39390 $D=3
M105 19 19 61 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=2.16e-12 AS=2.16e-12 PD=5.4e-07 PS=5.4e-07 $X=66390 $Y=48880 $D=3
M106 61 19 19 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=3.92e-12 AS=2.16e-12 PD=8.98e-06 PS=5.4e-07 $X=67380 $Y=39390 $D=3
M107 61 19 19 AVdd P_18_MM L=4.5e-07 W=8e-06 AD=3.92e-12 AS=2.16e-12 PD=8.98e-06 PS=5.4e-07 $X=67380 $Y=48880 $D=3
M108 56 30 56 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=68600 $Y=76680 $D=3
M109 AVdd 12 56 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=69590 $Y=76680 $D=3
M110 55 Vb2 1 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=1.225e-12 PD=3.48e-06 PS=3.48e-06 $X=70030 $Y=65810 $D=3
M111 56 Vb2 12 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=1.225e-12 PD=3.48e-06 PS=3.48e-06 $X=70030 $Y=70410 $D=3
M112 61 Vi+ 59 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=70130 $Y=39370 $D=3
M113 61 Vi- 58 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=70130 $Y=44250 $D=3
M114 61 Vi- 58 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=70130 $Y=49500 $D=3
M115 61 Vi+ 59 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=70130 $Y=54380 $D=3
M116 55 12 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=70580 $Y=76680 $D=3
M117 58 Vi- 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=71120 $Y=39370 $D=3
M118 59 Vi+ 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=71120 $Y=44250 $D=3
M119 59 Vi+ 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=71120 $Y=49500 $D=3
M120 58 Vi- 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=71120 $Y=54380 $D=3
M121 AVdd 12 55 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=71570 $Y=76680 $D=3
M122 61 Vi- 58 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=72110 $Y=39370 $D=3
M123 61 Vi+ 59 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=72110 $Y=44250 $D=3
M124 61 Vi+ 59 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=72110 $Y=49500 $D=3
M125 61 Vi- 58 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=72110 $Y=54380 $D=3
M126 56 Vb2 12 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=72320 $Y=65810 $D=3
M127 55 Vb2 1 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=72320 $Y=70410 $D=3
M128 56 12 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=72560 $Y=76680 $D=3
M129 59 Vi+ 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=73100 $Y=39370 $D=3
M130 58 Vi- 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=73100 $Y=44250 $D=3
M131 58 Vi- 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=73100 $Y=49500 $D=3
M132 59 Vi+ 61 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=73100 $Y=54380 $D=3
M133 12 Vb2 56 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=73310 $Y=65810 $D=3
M134 1 Vb2 55 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=73310 $Y=70410 $D=3
M135 56 33 56 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=73550 $Y=76680 $D=3
M136 1 Vb2 55 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=1.225e-12 PD=3.48e-06 PS=3.48e-06 $X=75600 $Y=65810 $D=3
M137 12 Vb2 56 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=1.225e-12 PD=3.48e-06 PS=3.48e-06 $X=75600 $Y=70410 $D=3
M138 18 34 18 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=80760 $Y=57150 $D=3
M139 12 Vpcas 18 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=81750 $Y=57150 $D=3
M140 12 35 12 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=82740 $Y=57150 $D=3
M141 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=85020 $Y=74480 $D=3
M142 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=85020 $Y=77860 $D=3
M143 5 36 5 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=1.225e-12 PD=5.4e-07 PS=3.48e-06 $X=85030 $Y=57150 $D=3
M144 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=86010 $Y=74480 $D=3
M145 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=86010 $Y=77860 $D=3
M146 1 Vpcas 5 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=86020 $Y=57150 $D=3
M147 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=87000 $Y=74480 $D=3
M148 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=87000 $Y=77860 $D=3
M149 1 37 1 AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=87010 $Y=57150 $D=3
M150 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=87990 $Y=74480 $D=3
M151 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=87990 $Y=77860 $D=3
M152 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=88980 $Y=74480 $D=3
M153 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=88980 $Y=77860 $D=3
M154 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=89970 $Y=74480 $D=3
M155 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=89970 $Y=77860 $D=3
M156 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=90960 $Y=74480 $D=3
M157 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=90960 $Y=77860 $D=3
M158 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=91950 $Y=74480 $D=3
M159 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=91950 $Y=77860 $D=3
M160 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=92940 $Y=74480 $D=3
M161 Vo 1 AVdd AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=6.75e-13 AS=6.75e-13 PD=5.4e-07 PS=5.4e-07 $X=92940 $Y=77860 $D=3
M162 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=93930 $Y=74480 $D=3
M163 AVdd 1 Vo AVdd P_18_MM L=4.5e-07 W=2.5e-06 AD=1.225e-12 AS=6.75e-13 PD=3.48e-06 PS=5.4e-07 $X=93930 $Y=77860 $D=3
M164 Vo 5 AGnd AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=42000 $Y=11180 $D=2
M165 Vo 5 AGnd AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=42000 $Y=13660 $D=2
M166 AGnd 5 Vo AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=42990 $Y=11180 $D=2
M167 AGnd 5 Vo AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=42990 $Y=13660 $D=2
M168 Vo 5 AGnd AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=43980 $Y=11180 $D=2
M169 Vo 5 AGnd AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=43980 $Y=13660 $D=2
M170 AGnd 5 Vo AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=44970 $Y=11180 $D=2
M171 AGnd 5 Vo AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=44970 $Y=13660 $D=2
M172 Vo 5 AGnd AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=45960 $Y=11180 $D=2
M173 Vo 5 AGnd AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=45960 $Y=13660 $D=2
M174 57 Vi+ 55 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=52780 $Y=28230 $D=2
M175 57 Vi- 56 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=52780 $Y=32070 $D=2
M176 56 Vi- 57 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=53770 $Y=28230 $D=2
M177 55 Vi+ 57 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=53770 $Y=32070 $D=2
M178 18 13 18 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=54220 $Y=14940 $D=2
M179 5 14 5 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=54220 $Y=17400 $D=2
M180 57 Vi- 56 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=54760 $Y=28230 $D=2
M181 57 Vi+ 55 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=54760 $Y=32070 $D=2
M182 58 Vb3 18 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=55210 $Y=14940 $D=2
M183 59 Vb3 5 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=55210 $Y=17400 $D=2
M184 55 Vi+ 57 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=55750 $Y=28230 $D=2
M185 56 Vi- 57 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=55750 $Y=32070 $D=2
M186 5 Vb3 59 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=57500 $Y=14940 $D=2
M187 18 Vb3 58 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=57500 $Y=17400 $D=2
M188 12 17 12 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=58030 $Y=22380 $D=2
M189 AGnd 18 58 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=58170 $Y=11600 $D=2
M190 19 19 57 AGnd N_18_MM L=4.5e-07 W=5.12e-06 AD=1.3824e-12 AS=2.5088e-12 PD=5.4e-07 PS=6.1e-06 $X=58480 $Y=28250 $D=2
M191 5 20 5 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=58490 $Y=14940 $D=2
M192 18 21 18 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=58490 $Y=17400 $D=2
M193 18 Vncas 12 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=59020 $Y=22380 $D=2
M194 59 18 AGnd AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=59160 $Y=11600 $D=2
M195 57 19 19 AGnd N_18_MM L=4.5e-07 W=5.12e-06 AD=1.3824e-12 AS=1.3824e-12 PD=5.4e-07 PS=5.4e-07 $X=59470 $Y=28250 $D=2
M196 18 24 18 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=60010 $Y=22380 $D=2
M197 19 19 57 AGnd N_18_MM L=4.5e-07 W=5.12e-06 AD=1.3824e-12 AS=1.3824e-12 PD=5.4e-07 PS=5.4e-07 $X=60460 $Y=28250 $D=2
M198 60 Vb4 AGnd AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=61450 $Y=11600 $D=2
M199 57 Vb3 60 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=61450 $Y=16170 $D=2
M200 57 19 19 AGnd N_18_MM L=4.5e-07 W=5.12e-06 AD=1.3824e-12 AS=1.3824e-12 PD=5.4e-07 PS=5.4e-07 $X=61450 $Y=28250 $D=2
M201 AGnd Vb4 60 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=62440 $Y=11600 $D=2
M202 60 Vb3 57 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=62440 $Y=16170 $D=2
M203 19 19 57 AGnd N_18_MM L=4.5e-07 W=5.12e-06 AD=1.3824e-12 AS=1.3824e-12 PD=5.4e-07 PS=5.4e-07 $X=62440 $Y=28250 $D=2
M204 60 Vb4 AGnd AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=63430 $Y=11600 $D=2
M205 57 Vb3 60 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=63430 $Y=16170 $D=2
M206 57 19 19 AGnd N_18_MM L=4.5e-07 W=5.12e-06 AD=1.3824e-12 AS=1.3824e-12 PD=5.4e-07 PS=5.4e-07 $X=63430 $Y=28250 $D=2
M207 AGnd Vb4 60 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=64420 $Y=11600 $D=2
M208 60 Vb3 57 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=64420 $Y=16170 $D=2
M209 19 19 57 AGnd N_18_MM L=4.5e-07 W=5.12e-06 AD=1.3824e-12 AS=1.3824e-12 PD=5.4e-07 PS=5.4e-07 $X=64420 $Y=28250 $D=2
M210 57 19 19 AGnd N_18_MM L=4.5e-07 W=5.12e-06 AD=1.3824e-12 AS=1.3824e-12 PD=5.4e-07 PS=5.4e-07 $X=65410 $Y=28250 $D=2
M211 5 26 5 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=65800 $Y=22380 $D=2
M212 19 19 57 AGnd N_18_MM L=4.5e-07 W=5.12e-06 AD=1.3824e-12 AS=1.3824e-12 PD=5.4e-07 PS=5.4e-07 $X=66400 $Y=28250 $D=2
M213 AGnd 18 59 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=66710 $Y=11600 $D=2
M214 1 Vncas 5 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=66790 $Y=22380 $D=2
M215 5 27 5 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=67380 $Y=14940 $D=2
M216 18 28 18 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=67380 $Y=17400 $D=2
M217 57 19 19 AGnd N_18_MM L=4.5e-07 W=5.12e-06 AD=2.5088e-12 AS=1.3824e-12 PD=6.1e-06 PS=5.4e-07 $X=67390 $Y=28250 $D=2
M218 58 18 AGnd AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=67700 $Y=11600 $D=2
M219 1 29 1 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=67780 $Y=22380 $D=2
M220 59 Vb3 5 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=68370 $Y=14940 $D=2
M221 58 Vb3 18 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=68370 $Y=17400 $D=2
M222 57 Vi+ 55 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=70120 $Y=28230 $D=2
M223 57 Vi- 56 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=70120 $Y=32070 $D=2
M224 18 Vb3 58 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=70660 $Y=14940 $D=2
M225 5 Vb3 59 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=70660 $Y=17400 $D=2
M226 56 Vi- 57 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=71110 $Y=28230 $D=2
M227 55 Vi+ 57 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=71110 $Y=32070 $D=2
M228 18 31 18 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=71650 $Y=14940 $D=2
M229 5 32 5 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=71650 $Y=17400 $D=2
M230 57 Vi- 56 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=72100 $Y=28230 $D=2
M231 57 Vi+ 55 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=72100 $Y=32070 $D=2
M232 55 Vi+ 57 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=73090 $Y=28230 $D=2
M233 56 Vi- 57 AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=73090 $Y=32070 $D=2
M234 AGnd 5 Vo AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=79760 $Y=11160 $D=2
M235 AGnd 5 Vo AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=7.84e-13 PD=5.4e-07 PS=2.58e-06 $X=79760 $Y=13640 $D=2
M236 Vo 5 AGnd AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=80750 $Y=11160 $D=2
M237 Vo 5 AGnd AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=80750 $Y=13640 $D=2
M238 AGnd 5 Vo AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=81740 $Y=11160 $D=2
M239 AGnd 5 Vo AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=81740 $Y=13640 $D=2
M240 Vo 5 AGnd AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=82730 $Y=11160 $D=2
M241 Vo 5 AGnd AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=4.32e-13 AS=4.32e-13 PD=5.4e-07 PS=5.4e-07 $X=82730 $Y=13640 $D=2
M242 AGnd 5 Vo AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=83720 $Y=11160 $D=2
M243 AGnd 5 Vo AGnd N_18_MM L=4.5e-07 W=1.6e-06 AD=7.84e-13 AS=4.32e-13 PD=2.58e-06 PS=5.4e-07 $X=83720 $Y=13640 $D=2
.ENDS
***************************************
