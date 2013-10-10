function [z] = par(varargin)
%PAR Summary of this function goes here
%   Detailed explanation goes here
    z = 1/sum(1./cell2mat(varargin));

end

