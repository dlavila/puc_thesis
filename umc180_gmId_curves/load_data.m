clc
global dat;
dat = load('tran_data.mat');

global default_vbs default_vds default_L;
default_vbs = 0; 
default_vds = 1;
default_L   = 0.18;

addpath('misc_functions');
addpath('gmId_functions');