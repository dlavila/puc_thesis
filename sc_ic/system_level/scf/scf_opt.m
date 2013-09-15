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

fs      = 51.95e6;
ts      = 1/fs;
tsett   = ts/5;

clear
clc


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

gamma   = 2/3;
K       = 1.3806488e-23; 
T       = 300; 
N       = 18;
resF    = 6;

piR     = 1;


Cs_min = 20e-15;
Cs_max = Cs_min*2^resF;
CF = Cs_max;

CL      = 0.05e-12;
bufferC = 340;


a_i_max = 1;
a_i_min = 1/(2^resF - 1);

beta_wc = 0.5;
beta_bc = 1;


%   Min1,2
%   ML1,2
%   Mt
%   Mabn1,2
%   Mabp1,2

PMmin = 80*pi/180;

L = [0.18 0.3 0.45];

gmId = 6:2:20;



% p2 = gmout / (C1 C2/ CC + C1 + C2)

% pc = beta*gmin / Cc

% pm = tan-1(p2/pc) 

% CCmin = Cot(PMmin)(1 - C1C2Tan(PMmin))/(C1+C2)

% C1 = Cdbin + Cdbl + Cgsabn + Cgsabp
% C2 = CL + Cdbabn + Cdbabp

Nktc = Qn2- 2*K*T/CF*3;

for k = 1:bufferC/10;
    for i_in = 1:length(L)
        for i_n = 1:length(L)
            for i_p = 1:length(L)
                for j_in = 1:length(gmId)
                    for j_n = 1:length(gmId)
                        for j_p = 1:length(gmId)
                            
                            It = k*10e-6;
                            Iab = (bufferC/10-k)*10e-6;
                            
                            gmin = gmId(j_in)*It/2;
                            
                            Vdsl = Vgs(gmId(j_n),0,Vdd/2,L(i_n), 'n');
                            Vdsl = Vgs(gmId(j_n),0,Vdsl,L(i_n), 'n');
                            Vdsl = Vgs(gmId(j_n),0,Vdsl,L(i_n), 'n');
                            
                            Ro1 = par(ro(gmId(j_in), 0, Vdd/2, L(i_in), 'p'), ro(gmId(j_n), 0, Vdsl, L(i_n), 'n'))/2;

                            Ain = gmin*Ro1;

                            gmout = (gmId(j_n)+gmId(j_p))*Iab/2;
                            
                            Ro2 = par(ro(gmId(j_n),0,Vocm,L(i_n),'n'),ro(gmId(j_p),0,(Vdd-Vocm),L(i_p),'p'));
                            
                            Aab = gmout*Ro2;
                            
                            A = 2*Ain*Aab;
                            
                            if(A>1000) 
                                W_in    = It/2/Id_W(gmId(j_in),0, Vdd/2, L(i_in), 'p');
                                W_l     = It/2/Id_W(gmId(j_n),0, Vdsl, L(i_n),'n');
                                W_ab_n  = Iab/2/Id_W(gmId(j_n),0, Vocm, L(i_n), 'n');
                                W_ab_p  = Iab/2/Id_W(gmId(j_p),0, (Vdd-Vocm), L(i_p), 'p');
                                C1 = C_per_W('db', gmId(j_in),0,Vdd/2, L(i_in),'p')*W_in + C_per_W('db', gmId(j_n),0,Vdsl, L(i_n),'n')*W_l+C_per_W('gs', gmId(j_n),0,Vocm, L(i_n),'n')*W_ab_n+C_per_W('gs', gmId(j_p),0,(Vdd-Vocm), L(i_p),'p')*W_ab_p;
                                C2 = CL + C_per_W('db', gmId(j_n),0,Vocm, L(i_n),'n')*W_ab_n + C_per_W('db', gmId(j_p),0,(Vdd-Vocm), L(i_p),'p')*W_ab_p;
                                
                                
                                
                                %Cc_min = (gmin*tan(PMmin)*(C1+C2)+sqrt(gmin*tan(PMmin)*(4*C1*C2*gmout+(C1+C2)^2*gmin*tan(PMmin))))/(2*gmout);
                                Cc_min = 2*N*gamma*K*T*(1+gml/gmin)/(Nktc);
                                
                                
                                
                                pc = gmin/(2*pi*Cc_min);
                                p2 = gmout / (C1*C2/ CC + C1 + C2);
                                
                                PM = tan
                                
                                if(gmout/gmin*Cc_min/C1 > 10 && pc > 1e8)
                                   A;
                                   pc
                                   Cc_min
                                   
                                   
                                   
                                   gml = gmId(j_n)*It/2;
                                   gmab_n = gmId(j_n)*Iab/2;
                                   gmab_p = gmId(j_p)*Iab/2;
                                   2*N*(gamma*K*T/Cc_min*(1+gml/gmin))
                                   gml/gmin
                                   %+K*T/C2*(1+gamma*(1+gmab_p/(gmab_n+gmab_p))))
                                end
                                %gmin/(2*pi*Cc_min)
                                %gmout/(2*pi*(C1*C2/Cc_min+C1+C2))
                                
                                
                                %Cc_min = cot(PMmin)*(1-C1*C2*tan(PMmin))/(C1+C2)
                                
                            end
                        end
                    end
                end
            end
        end
    end
end
