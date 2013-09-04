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


FSR     = 1;
NB      = 10;
LSB     = FSR/(2^NB-1);

Qn2     = LSB^2/12;

gamma   = 0.9;
K       = 1.3806488e-23; 
T       = 300; 
N       = 16;
resF    = 6;

piR     = 1;


bufferC = 250e-6;


a_i_max = 1;
a_i_min = 1/(2^resF - 1);

beta_wc = 0.5;
beta_bc = 1;

