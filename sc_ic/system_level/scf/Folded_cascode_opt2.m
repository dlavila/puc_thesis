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

Cs = 40e-12;
CF = 0.45e-12;

beta_wc = 0.01;
beta_bc = 1;

CL = 0;%2e-12;
CLt_max = CL + (1-beta_wc)*CF;

L = [0.45 0.6];

gmId = 3.9:5.4:21;


%% Folded cascode transistors
          
%         Independent variables
% Min   : L_in, gmId_in
% Mf    : L_p, gmId_p
% Mcin  : L_p, gmId_p
% Mcl   : L_n, gmId_n
% Ml    : L_n, gmId_n
%         It, Il for a fixed If

Ibudget = 1100;
If = Ibudget*1e-6;
idx = zeros(13276306,12);

Vds_in = Vdd/2;
Vds_f  = 0.3;
Vds_cin = Vdd/4.4;
Vds_cl = Vdd/4.4;
Vds_l  = 0.1;
count = 1;


k = 1000;
It = k*1e-6;
Il = (Ibudget-k)*1e-6;

%%
for i_in = 1:length(L)
    for i_f = 1:length(L)
        for i_cin = 1:length(L)
            for i_cl = 1:length(L)
                for i_l = 1:length(L)
                    for j_in = 1:length(gmId)
                        gm_in = gmId(j_in)*It;
                        for j_f = 1:length(gmId)
                            for j_l = 1:length(gmId)
                                for j_cin = 1:length(gmId)
                                    for j_cl = 1:length(gmId)
                                        % Min
                                        ro_in = ro(gmId(j_in), 0, Vds_in, L(i_in), 'n');

                                        % Mf
                                        gm_f  = gmId(j_f)*If/2;
                                        ro_f  = ro(gmId(j_f), 0, Vds_f, L(i_f), 'p');

                                        % Mcin
                                        gm_cin  = gmId(j_cin)*Il/2;
                                        ro_cin  = ro(gmId(j_cin), 0, Vds_cin, L(i_cin), 'p');

                                        % Mcl
                                        gm_cl  = gmId(j_cl)*Il/2;
                                        ro_cl  = ro(gmId(j_cl), 0, Vds_cl, L(i_cl), 'n');

                                        % Ml
                                        gm_l  = gmId(j_l)*Il/2;
                                        ro_l  = ro(gmId(j_l), 0, Vds_l, L(i_l), 'n');


                                        Ro    = par(gm_cl*ro_cl*ro_l, gm_cin*ro_cin*par(ro_in,ro_f));

                                        Av    = gm_in*Ro;

                                        if(Av > 1000)
                                            W_in    = It/Id_W(gmId(j_in), 0, Vdd/2, L(i_in), 'n');
                                            W_f     = If/Id_W(gmId(j_f), 0, Vds_f, L(i_f), 'p');
                                            W_cin   = Il/Id_W(gmId(j_cin), 0, Vds_cin, L(i_cin), 'p');
                                            W_cl    = Il/Id_W(gmId(j_cl), 0, Vds_cl, L(i_cl), 'n');
                                            W_l     = Il/Id_W(gmId(j_l), 0, Vds_l, L(i_l), 'n');


                                            C_LA = (C_per_W('gd', gmId(j_f), Vds_f, L(i_f), 'p') + C_per_W('db', gmId(j_f), Vds_f, L(i_f), 'p'))*W_f ...
                                                 + (C_per_W('db', gmId(j_in), Vds_in, L(i_in), 'n') + C_per_W('gd', gmId(j_in), Vds_in, L(i_in), 'n'))*W_in ...
                                                 + (C_per_W('gs', gmId(j_cin), Vds_cin, L(i_cin), 'p') + C_per_W('gb', gmId(j_cin), Vds_cin, L(i_cin), 'p'))*W_cin;

                                            C_LB = C_per_W('gd', gmId(j_cl), Vds_cl, L(i_cl), 'n')*W_cl + C_per_W('gd', gmId(j_cin), Vds_cin, L(i_cin), 'p')*W_cin;


                                            pc = gm_in/C_LB/(2*pi);
                                            p2 = gm_cin/C_LA/(2*pi);
                                            
                                            if(pc>20e6 && p2> pc)
                                                Av
                                                pc
                                                p2
                                                PM = atan(p2/pc)*180/pi
                                                W_in
                                                L(i_in)
                                                W_f
                                                L(i_f)
                                                W_cin
                                                L(i_cin)
                                                W_cl
                                                L(i_cl)
                                                W_l
                                                L(i_l)
                                            
                                                idx(count,:) = [k, Av ,i_in , i_f, i_cin, i_cl, i_l,j_in,j_f,j_cin,j_cl,j_l];
                                                count = count + 1;
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

save('folded_step1.mat','idx','L','gmId','Ibudget','Vds_in','Vds_f','Vds_cin','Vds_cl','Vds_l')
