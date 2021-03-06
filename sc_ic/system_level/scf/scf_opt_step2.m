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

Vocm = Vdd/2;

FSR     = 1;
NB      = 10;
LSB     = FSR/(2^NB-1);

Qn2     = LSB^2/12;

gamma   = 0.9;
K       = 1.3806488e-23; 
T       = 300; 
N       = 18;
resF    = 6;


Cs_min = 20e-15;
Cs_max = Cs_min*2^resF;
CF = 2e-12;

CL      = 0; %5e-12;

a_i_max = 1;
a_i_min = 1/(2^resF - 1);

beta_wc = 0.5;
beta_bc = 1;

CLt_max = CL + (1-beta_wc)*CF;

L = [0.18 0.3 0.45];

gmId = 4:2.3:21;

NBf = Qn2- 2*K*T/CF*3;

x = 1;

y = 3/4*(NBf*(1+x)/(4*K*T/CF)-7/3-2*x);

%% Folded cascode transistors
          
%         Independent variables
% Min   : L_in, gmId_in
% Mf    : L_p, gmId_p
% Mcin   : L_p, gmId_p
% Mcl   : L_n, gmId_n
% Ml    : L_n, gmId_n
%         It, Il for a fixed If

Ibudget = 400;
If = Ibudget*10e-6;

Vds_f  = Vdd/4.6;
Vds_cf = Vdd/4.6;
Vds_cl = Vdd/4.6;
Vds_l  = Vdd/4.6;


load scf_opt_sol_step1.mat
%idx(x, :) = [k, Av , i_in, i_f, i_cin, i_cl, i_l,j_in,j_f,j_cin,j_cl,j_l];


i = 10;

k           = idx(:,1);
gmId_in     = gmId(idx(:,8));
gmId_f      = gmId(idx(:,9));
gmId_cin    = gmId(idx(:,10));
gmId_cl     = gmId(idx(:,11));
gmId_l      = gmId(idx(:,12));
L_in        = L(idx(:,3));
L_f         = L(idx(:,4));
L_cin       = L(idx(:,5));
L_cl        = L(idx(:,6));
L_l         = L(idx(:,7));

idx2 = [];

for i = 1:length(k)
    It = k(i)*10e-6;
    Il = (Ibudget/10-k(i))*10e-6;

    gm_in   = gmId_in(i)*It/2;
    ro_in   = ro(gmId_in(i), 0, Vdd/2, L_in(i), 'p');
    W_in    = It/2/Id_W(gmId_in(i), 0, Vdd/2, L_in(i), 'p');
    
    % Mf
    gm_f    = gmId_f(i)*If/2;
    ro_f    = ro(gmId_f(i), 0, Vds_f, L_f(i), 'p');
    W_f     = If/2/Id_W(gmId_f(i), 0, Vds_f, L_f(i), 'p');
    
    % Mcin
    gm_cin   = gmId_cin(i)*Il/2;
    ro_cin   = ro(gmId_cin(i), 0, Vds_cin, L_cin(i), 'p');
    W_cin    = Il/2/Id_W(gmId_cin(i), 0, Vds_cin, L_cin(i), 'p');
    
    % Mcl
    gm_cl   = gmId_cl(i)*Il/2;
    ro_cl   = ro(gmId_cl(i), 0, Vds_cl, L_cl(i), 'n');
    W_cl    = Il/2/Id_W(gmId_cl(i), 0, Vds_cl, L_cl(i), 'n');
    
    % Ml
    gm_l    = gmId_l(i)*Il/2;
    ro_l    = ro(gmId_l(i), 0, Vds_l, L_l(i), 'n');
    W_l     = Il/2/Id_W(gmId_l(i), 0, Vds_l, L_l(i), 'n');
    
    
    Ro = par(gm_cl*ro_cl*ro_l, gm_cin*ro_cin*par(ro_in,ro_f));
    Av = 2*gm_in*Ro;
    
    SR = It/CL;
    
    C_LA = (C_per_W('gd', gmId_f(i), Vds_f, L_f(i), 'p') + C_per_W('db', gmId_f(i), Vds_f, L_f(i), 'p'))*W_f ...
         + (C_per_W('db', gmId_in(i), Vds_in, L_in(i), 'p') + C_per_W('gd', gmId_in(i), Vds_in, L_in(i), 'p'))*W_in ...
         + (C_per_W('gs', gmId_cin(i), Vds_cin, L_cin(i), 'p') + C_per_W('gb', gmId_cin(i), Vds_cin, L_cin(i), 'p'))*W_cin;
         %+ (C_per_W('gs', gmId_cin(i), Vds_cin, L_cin(i), 'p') + C_per_W('gb', gmId_cin(i), Vds_cin, L_cin(i), 'p'))*W_cin;
    
    C_LB = C_per_W('gd', gmId_cl(i), Vds_cl, L_cl(i), 'n')*W_cl + C_per_W('gd', gmId_cin(i), Vds_cin, L_cin(i), 'p')*W_cin + CL + 2e-12;
    
    C_LC = (C_per_W('db', gmId_l(i), Vds_l, L_l(i), 'n') +  C_per_W('gd', gmId_l(i), Vds_l, L_l(i), 'n'))*W_l ...
         + (C_per_W('gs', gmId_cl(i), Vds_cl, L_cl(i), 'n') + C_per_W('gb', gmId_cl(i), Vds_cl, L_cl(i), 'n'))*W_cl;
    
     
    pc = gm_in/C_LB/(2*pi);
    p2 = gm_cin/C_LA/(2*pi);
    p3 = gm_cl/C_LC/(2*pi);
    
    PM = atan(p2/pc);
    
    if(PM*180/pi > 70 && pc > 140e6 && 20*log10(Av)> 63)
        Av
        pc
        PM*180/pi
       idx2 = [idx2 i]; 
    end
end

%%
asd = 3;

k           = idx(idx2(asd),1);
gmId_in     = gmId(idx(idx2(asd),8));
gmId_f      = gmId(idx(idx2(asd),9));
gmId_cin    = gmId(idx(idx2(asd),10));
gmId_cl     = gmId(idx(idx2(asd),11));
gmId_l      = gmId(idx(idx2(asd),12));
L_in        = L(idx(idx2(asd),3))
L_f         = L(idx(idx2(asd),4))
L_cin       = L(idx(idx2(asd),5))
L_cl        = L(idx(idx2(asd),6))
L_l         = L(idx(idx2(asd),7))


It = k*10e-6;
Il = (Ibudget/10-k)*10e-6;

    gm_in   = gmId_in*It/2;
    ro_in   = ro(gmId_in, 0, Vdd/2, L_in, 'p');
    W_in    = It/2/Id_W(gmId_in, 0, Vdd/2, L_in, 'p');
    
    % Mf
    gm_f    = gmId_f*If/2;
    ro_f    = ro(gmId_f, 0, Vds_f, L_f, 'p');
    W_f     = If/2/Id_W(gmId_f, 0, Vds_f, L_f, 'p');
    
    % Mcin
    gm_cin   = gmId_cin*Il/2;
    ro_cin   = ro(gmId_cin, 0, Vds_cin, L_cin, 'p');
    W_cin    = Il/2/Id_W(gmId_cin, 0, Vds_cin, L_cin, 'p');
    
    % Mcl
    gm_cl   = gmId_cl*Il/2;
    ro_cl   = ro(gmId_cl, 0, Vds_cl, L_cl, 'n');
    W_cl    = Il/2/Id_W(gmId_cl, 0, Vds_cl, L_cl, 'n');
    
    % Ml
    gm_l    = gmId_l*Il/2;
    ro_l    = ro(gmId_l, 0, Vds_l, L_l, 'n');
    W_l     = Il/2/Id_W(gmId_l, 0, Vds_l, L_l, 'n');
    
    
    Ro = par(gm_cl*ro_cl*ro_l, gm_cin*ro_cin*par(ro_in,ro_f));
    Av = 2*gm_in*Ro;
    
    SR = It/CL;
    
    C_LA = (C_per_W('gd', gmId_f, Vds_f, L_f, 'p') + C_per_W('db', gmId_f, Vds_f, L_f, 'p'))*W_f ...
         + (C_per_W('db', gmId_in, Vds_in, L_in, 'p') + C_per_W('gd', gmId_in, Vds_in, L_in, 'p'))*W_in ...
         + (C_per_W('gs', gmId_cin, Vds_cin, L_cin, 'p') + C_per_W('gb', gmId_cin, Vds_cin, L_cin, 'p'))*W_cin;
         %+ (C_per_W('gs', gmId_cin, Vds_cin, L_cin, 'p') + C_per_W('gb', gmId_cin, Vds_cin, L_cin, 'p'))*W_cin;
    
    C_LB = C_per_W('gd', gmId_cl, Vds_cl, L_cl, 'n')*W_cl + C_per_W('gd', gmId_cin, Vds_cin, L_cin, 'p')*W_cin + CL + 2e-12;
    
    C_LC = (C_per_W('db', gmId_l, Vds_l, L_l, 'n') +  C_per_W('gd', gmId_l, Vds_l, L_l, 'n'))*W_l ...
         + (C_per_W('gs', gmId_cl, Vds_cl, L_cl, 'n') + C_per_W('gb', gmId_cl, Vds_cl, L_cl, 'n'))*W_cl;
    
     
    pc = gm_in/C_LB/(2*pi);
    p2 = gm_cin/C_LA/(2*pi);
    p3 = gm_cl/C_LC/(2*pi);
    
    PM = atan(p2/pc);

