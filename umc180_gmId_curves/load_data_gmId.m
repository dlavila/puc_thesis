clc

if exist('path_gmId_curves','var')
    addpath([path_gmId_curves '/misc_functions']);
    addpath([path_gmId_curves '/gmId_functions']);
else
    addpath('misc_functions');
    addpath('gmId_functions');
end

global dat;
dat = load('tran_data.mat');

global default_vbs default_vds default_L;
default_vbs = 0; 
default_vds = 1;
default_L   = 0.18;

