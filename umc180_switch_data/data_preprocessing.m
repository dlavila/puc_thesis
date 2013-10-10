clear
clc
data_switch_n
data_switch_p 

addpath('misc_functions');
addpath('switch_functions');

r_cmos_ref = 15:5:2000;

rmax = zeros(length(L_n), length(r_cmos_ref));
Wn_post   = zeros(length(L_n), length(r_cmos_ref));
Wp_post   = zeros(length(L_n), length(r_cmos_ref));

disp('Processing switchs resistance data')
reverseStr = '';
percent_tot = length(L_n)*length(r_cmos_ref);
percent_count = 0;
for j = 1:length(L_n)   
    for i = 1:length(r_cmos_ref)
        [Wn_post(j,i),Wp_post(j,i)] = cmos_switch_dim_rmin(r_cmos_ref(i),L_n(j));
        rn = switch_r(Vin_n,Wn_post(j,i),L_n(j),'n');
        rp = switch_r(Vin_p,Wp_post(j,i),L_n(j),'p');
        
        rpar = zeros(1, length(rn));
        for k=1:length(rn)
          rpar(k) = par(rn(k),rp(k));  
        end
        
        rmax(j,i) = max(rpar);
        
        msg = sprintf('Processed %d percent', int8(100*percent_count/percent_tot));
        fprintf([reverseStr, msg])
        reverseStr = repmat(sprintf('\b'), 1, length(msg));
        percent_count = percent_count + 1;
    end
    
end
fprintf('\n')

clear r_cmos_ref reverseStr percent_tot percent_count rn rp rpar msg j k u 
save switch_data.mat