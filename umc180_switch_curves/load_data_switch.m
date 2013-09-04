clc

if exist('path_switch_curves','var')
    addpath([path_switch_curves '/misc_functions']);
    addpath([path_switch_curves '/switch_functions']);
else
    addpath('misc_functions');
    addpath('switch_functions');
end

global s_dat;
s_dat = load('switch_data.mat');

global default_L;
default_L   = 0.18;


asd = zeros(1, length(s_dat.W_n));
for i=1:length(s_dat.W_n)
    asd(i) = s_dat.r_switch_n(1,1,i);
end
