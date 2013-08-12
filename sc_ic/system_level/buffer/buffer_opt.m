clc
clear

current_dir         = pwd;
pwd_levels          = strfind(pwd,'/');
project_folder      = current_dir(1:(pwd_levels(end-2)-1));
path_gmId_curves    = [project_folder '/umc180_gmId_curves'];
path_switch_curves  = [project_folder '/umc180_switch_curves'];

addpath(path_gmId_curves);
addpath(path_switch_curves);

load_data_gmId;
load_data_switch


%   Min_n
%   Min_p
%   Mc_n
%   Mc_p
%   Mf_n
%   Mf_p
%   Mout_n
%   Mout_p


FSR     = 1;
fs      = 51.95e6;
ts      = 1/fs;
tsett   = ts/5;

minSR   = FSR/tsett;

Aobj    = 10^(90/20);
Pmobj   = 70;

CL      = 5e-12;

IL      = CL*minSR;



%%

gm_in =  gm_in_n;
gm_in_p = gm_in_p;


Ra = gm_c_p*r0_c_p*par(r0_f_p, r0_in_n);
Rb = gm_c_n*r0_c_n*par(r0_f_n, r0_in_p);

Rout1 = par(Ra,Rb);

gm_out = gm_out_p + gm_out_n;

Rout2 = par(r0_out_n, r0_out_p);

Av1 = gm_in*Rout1;
Av2 = gm_out*Rout2;

A = Av1*Av2;
