clear
clc
data_n
data_p

addpath('misc_functions')

vgs_n = zeros(size(vt_n));
vgs_p = zeros(size(vt_p));

lvgs_n = length(Vgs_n);
lvgs_p = length(Vgs_p);

for i=1:numel(vt_n(1,:,:,:))
   vgs_n((lvgs_n*(i-1)+1):(lvgs_n*i)) = Vgs_n;
end

for i=1:numel(vt_p(1,:,:,:))
   vgs_p((lvgs_p*(i-1)+1):(lvgs_p*i)) = Vgs_p;
end

vov_n = vgs_n - vt_n;
vov_p = vgs_p - abs(vt_p);

id_p = abs(id_p); 

gmId_n = gm_n./id_n;
gmId_p = gm_p./id_p;

for i=1:numel(gmId_n(1,:,:,:))
    gmId_n((lvgs_n*(i-1)+1):(lvgs_n*i)) = weak_decr_right(gmId_n((lvgs_n*(i-1)+1):(lvgs_n*i)));
end

for i=1:numel(gmId_p(1,:,:,:))
    gmId_p((lvgs_p*(i-1)+1):(lvgs_p*i)) = weak_decr_right(gmId_p((lvgs_p*(i-1)+1):(lvgs_p*i)));
end

clear i lvgs_n lvgs_p 

av_n = gm_n./gds_n;
av_p = gm_p./gds_p;

fT_n = 1/(2*pi)* gm_n./cgg_n;
fT_p = 1/(2*pi)* gm_p./cgg_p;

wsvars = evalin('caller', 'who');
for wscon=1:size(wsvars,1)
    thisvar=evalin('caller', wsvars{wscon});
    dat.(wsvars{wscon})=thisvar;
end

save('tran_data', '-struct', 'dat') 
