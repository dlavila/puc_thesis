W	= [0.3;0.6;1.2];
L	= [0.18;0.36;0.72;0.49];
Vds	= [0.01;0.03;0.06;0.09;0.1;0.2;0.3;0.4;0.5;0.6;0.7;0.8;0.9;1;1.1;1.2;1.3;1.4;1.5;1.6;1.7;1.8];
Vgs	= (0.1:0.01:1.8)';

%	Stored transistor parameters: id , gm , gmb , gds , ro , vt , cgs , cgd , cgb , csb , cdb , cgg

id_n	= zeros(171,22,4,3);
gm_n	= zeros(171,22,4,3);
gmb_n	= zeros(171,22,4,3);
gds_n	= zeros(171,22,4,3);
ro_n	= zeros(171,22,4,3);
vt_n	= zeros(171,22,4,3);
cgs_n	= zeros(171,22,4,3);
cgd_n	= zeros(171,22,4,3);
cgb_n	= zeros(171,22,4,3);
csb_n	= zeros(171,22,4,3);
cdb_n	= zeros(171,22,4,3);
cgg_n	= zeros(171,22,4,3);
