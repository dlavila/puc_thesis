function [y] = par(varargin)
    y = sum(1./cell2mat(varargin))^-1;
end

