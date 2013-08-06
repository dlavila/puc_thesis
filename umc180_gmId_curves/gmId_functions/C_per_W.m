function [y] = C_per_W(varargin)
% C_per_W Capacitance per transistor weight (um).
%   C_per_W(nodes, gmId, Vbs, Vds, L, flavor) returns C_nodes/W for a given
%   set (gmId, Vbs, Vds, L, flavor), where:
%
%   - nodes: nodes where the capacitance is measured, ej: gg, gs, gd, etc.
%   - gmId: transistor transconductance over drain current (mS/mA) 
%           (can be a vector).
%   - Vbs:  voltage between transistor body and transistor source (V).
%   - Vds:  voltage between transistor drain and transistor source (V).
%   - L:    transistor length (um).
%   - flavor: 'n' -> nmos , 'p' -> pmos
%
%   Example
%       Cgs = C_per_W('gs', 1:30, 0, 1.8, 0.18, 'n');
%
%   C_per_W(nodes, gmId, Vds, L, flavor)
%       same as above but using defaul_vbs (global variable).
%
%   C_per_W(nodes, gmId, L, flavor)
%       same as above but using defaul_vds (global variable).
%
%   C_per_W(nodes, gmId, flavor)
%       same as above but using defaul_L (global variable).
%
%   See also core_function

    global default_vbs default_vds default_L
    if nargin < 3 || 6 < nargin
        error('myApp:argChk', 'Wrong number of input arguments')
    elseif nargin == 3
        gmId    = varargin{2};
        Vbs     = default_vbs;
        Vds     = default_vds;
        L       = default_L;
        flavor  = varargin{3};
    elseif nargin == 4
        gmId    = varargin{2};
        Vbs     = default_vbs;
        Vds     = default_vds;
        L       = varargin{3};
        flavor  = varargin{4};
    elseif nargin == 5
        gmId    = varargin{2};
        Vbs     = default_vbs;
        Vds     = varargin{3};
        L       = varargin{4};
        flavor  = varargin{5};
    else
        gmId    = varargin{2};
        Vbs     = varargin{3};
        Vds     = varargin{4};
        L       = varargin{5};
        flavor  = varargin{6};
    end
    nodes = varargin{1};
    
    y = abs(core_function(['dat.c'  nodes  '_' flavor '/dat.W_' flavor],gmId,Vbs,Vds,L,flavor));
end

