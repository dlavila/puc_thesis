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

%%vi = interpn(Vgs_n,Vds_n,L_n,W_n,gmId_n, 0.5,0.5,0.36,0.6,'spline');
