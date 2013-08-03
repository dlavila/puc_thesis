clear
clc
data_n
data_p

%%

vgs_n = zeros(size(vt_n));
vgs_p = zeros(size(vt_p));

lvgs_n = length(Vgs_n);
lvgs_p = length(Vgs_p);

for i=1:numel(vt_n(1,:,:,:))
   vgs_n((lvgs_n*(i-1)+1):(lvgs_n*i)) = Vgs_n;
end

for i=1:numel(vt_p(1,:,:,:))
   vgs_n((lvgs_p*(i-1)+1):(lvgs_p*i)) = Vgs_p;
end

vov_n = vgs_n - vt_n;
vov_p = vgs_p - abs(vt_p);

clear vgs_n vgs_p

id_p = abs(id_p); 

gmId_n = gm_n./id_n;
gmId_p = gm_p./id_p;

for i=1:numel(gmId_n(1,:,:,:))
    rev_arr = fliplr(gmId_n((lvgs_n*(i-1)+1):(lvgs_n*i)));
    gmId_n((lvgs_n*(i-1)+1):(lvgs_n*i)) = fliplr(cumsum([rev_arr(1) subplus(diff(rev_arr))]));
end

W_n	= [0.3;0.6;1.2];
L_n	= [0.18;0.36;0.72;0.49];
Vds_n	= [0.01;0.03;0.06;0.09;0.1;0.2;0.3;0.4;0.5;0.6;0.7;0.8;0.9;1;1.1;1.2;1.3;1.4;1.5;1.6;1.7;1.8];
Vgs_n	= (0.1:0.01:1.8)';


%vi = interpn(x,y,z,t,gmId_n,W_n,L_n,Vds_n,Vgs_n,'spline');
