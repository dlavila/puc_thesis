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



% CSA            Qn2 
% Buffers   0.25*Qn2
% SCF       0.5 *Qn2
% ADC            Qn2

% Previous Cf = 0.9 pF DCal mode, Cf = 45 pF SDT mode. 

%CD = 20pF;

%tpulse = 308ns;

%36.9pC STD mode.
%36.9pC/100 DCal mode. tal vez /100

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
CF = 2e-12;%Cs_max;

CL      = 0.05e-12;



a_i_max = 1;
a_i_min = 1/(2^resF - 1);

beta_wc = 0.5;
beta_bc = 1;


%L = [0.6];
L = [0.18 0.3 0.45 0.6];

gmId = 4:2.3:21;


NBf = Qn2- 2*K*T/CF*3;

x = 0.5;

y = 3/4*(NBf*(1+x)/(4*K*T/CF)-7/3-2*x);

%% Variables
% Min   : L_in, gmId_in
% Mf    : L_p, gmId_p
% Mcf   : L_p, gmId_p
% Mcl   : L_n, gmId_n
% Ml    : L_n, gmId_n


Ibudget = 400;
If = Ibudget*10e-6;
idx = [];
for k = 20:Ibudget/10;
    
    It = k*10e-6;
    Il = (Ibudget/10-k)*10e-6;
    
    for i_in = 1:length(L)
        for i_f = 1:length(L)
            for i_cf = 1:length(L)
                for i_cl = 1:length(L)
                    for i_l = 1:length(L)
                        for j_in = 1:length(gmId)
                            gm_in = gmId(j_in)*It/2;
                            for j_f = find(gmId <= y*gmId(j_in)*It/If)
                                for j_l = find(gmId <=((y*gmId(j_in)*It-gmId(j_f)*If)/Il))
                                    for j_cf = 1:length(gmId)
                                        for j_cl = 1:length(gmId)

                                            % Min
                                            ro_in = ro(gmId(j_in), 0, Vdd/2, L(i_in), 'p');

                                            % Mf
                                            gm_f = gmId(j_f)*If/2;

                                            %Vds_f = 2*Vov(gmId(j_n),0,Vdd/2,L(i_n), 'n');
                                            %Vds_f = 2*Vov(gmId(j_n),0,Vds_f,L(i_n), 'n');
                                            %Vds_f = 2*Vov(gmId(j_n),0,Vds_f,L(i_n), 'n');
                                            Vds_f = Vdd/4.6;

                                            ro_f  = ro(gmId(j_f), 0, Vds_f, L(i_f), 'n');

                                            % Mcf
                                            gm_cf = gmId(j_cf)*Il/2;

                                            %Vds_cf = 2*Vov(gmId(j_n),0,Vdd/2,L(i_n), 'n');
                                            %Vds_cf = 2*Vov(gmId(j_n),0,Vds_cf,L(i_n), 'n');
                                            %Vds_cf = 2*Vov(gmId(j_n),0,Vds_cf,L(i_n), 'n');
                                            Vds_cf = Vdd/4.6;

                                            ro_cf  = ro(gmId(j_cf), 0, Vds_cf, L(i_cf), 'n');

                                            % Mcl
                                            gm_cl = gmId(j_cl)*Il/2;

                                            %Vds_cl = 2*abs(Vov(gmId(j_p),0,Vdd/2,L(i_p), 'p'));
                                            %Vds_cl = 2*abs(Vov(gmId(j_p),0,Vds_cl,L(i_p), 'p'));
                                            %Vds_cl = 2*abs(Vov(gmId(j_p),0,Vds_cl,L(i_p), 'p'));
                                            Vds_cl = Vdd/4.6;

                                            ro_cl  = ro(gmId(j_cl), 0, Vds_cl, L(i_cl), 'p');

                                            % Ml
                                            gm_l = gmId(j_l)*Il/2;

                                            %Vds_l = 2*abs(Vov(gmId(j_p),0,Vdd/2,L(i_p), 'p'));
                                            %Vds_l = 2*abs(Vov(gmId(j_p),0,Vds_l,L(i_p), 'p'));
                                            %Vds_l = 2*abs(Vov(gmId(j_p),0,Vds_l,L(i_p), 'p'));
                                            Vds_l = Vdd/4.6;

                                            ro_l  = ro(gmId(j_l), 0, Vds_l, L(i_l), 'p');

                                            Ro = par(gm_cl*ro_cl*ro_l, gm_cf*ro_cf*par(ro_in,ro_f));

                                            Av = 2*gm_in*Ro;
                                            
                                            y = (gm_f+gm_l)/gm_in;

                                            if(Av > 1000)
                                                Av 
                                                y
                                                gmId(j_in)
                                                gmId(j_f)
                                                gmId(j_l)
                                                gmId(j_cf)
                                                gmId(j_cl)
                                                idx = [idx ; [k,Av,y,i_in, i_f, i_cf, i_cl, i_l,j_in,j_f,j_l,j_cf,j_cl]];
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
