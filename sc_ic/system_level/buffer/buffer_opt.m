clc
clear

current_dir         = pwd;
if isunix
    sl = '/';
else
    sl = '\';
end
pwd_levels          = strfind(pwd,sl);
project_folder      = current_dir(1:(pwd_levels(end-2)-1));
path_gmId_curves    = [project_folder sl 'umc180_gmId_curves'];
path_switch_curves  = [project_folder sl 'umc180_switch_curves'];

addpath(path_gmId_curves);
addpath(path_switch_curves);

load_data_gmId;


Vdd     = 1.8;
Vds     = Vdd/2;
Vocm    = Vdd/2;


%   Min_n
%   Min_p
%   Mc_n
%   Mc_p
%   Mf_n
%   Mf_p
%   Mout_n
%   Mout_p

CL      = 8e-12;
L = 0.45;

It = 60e-6;
Ic = 60e-6;
Il = 90e-6;
Iab = 240e-6;

gmId_in = 18;
gmId_ip = 17;
gmId_lp = 12.2;
gmId_ln = 12.3;
gmId_cp = 14;
gmId_cn = 14;
gmId_outn = 9.6;
gmId_outp = 9.7;


gm_in = gmId_in*It/4; 
gm_ip = gmId_ip*It/4;

gm_cp = gmId_cp*Ic/2;
gm_cn = gmId_cn*Ic/2;

gm_outn = gmId_outn*Iab;
gm_outp = gmId_outp*Iab;

ro_in = ro(gmId_in, 0, Vdd/2, L, 'n');
ro_ip = ro(gmId_ip, 0, Vdd/2, L, 'p');
ro_ln = ro(gmId_ln, 0, Vds, L, 'n');
ro_lp = ro(gmId_lp, 0, Vds, L, 'p');
ro_cn = ro(gmId_cn, 0, Vds, L, 'n');
ro_cp = ro(gmId_cp, 0, Vds, L, 'p');
ro_outn = ro(gmId_outn, 0, Vocm, L, 'n');
ro_outp = ro(gmId_outp, 0, Vocm, L, 'p');


gm_in =  gm_in + gm_ip;


Ra = gm_cp*ro_cp*par(ro_lp, ro_in);
Rb = gm_cn*ro_cn*par(ro_ln, ro_ip);

Rout1 = par(Ra,Rb);

gm_out = gm_outp + gm_outn;

Rout2 = par(ro_outn, ro_outp);

Av1 = gm_in*Rout1;
Av2 = gm_out*Rout2;

A = Av1*Av2;


It/4/Id_W(gmId_in,0,Vdd/2,L,'n')
