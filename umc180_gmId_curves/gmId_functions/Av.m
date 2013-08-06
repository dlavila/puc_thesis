function [y] = Av(varargin)
% Av Intrinsic gain (V/V), defined as gm/gds or gm*ro.
%   Av(gmId, Vbs, Vds, L, flavor) returns gm/gds for a given 
%   set (gmId, Vbs, Vds, L, flavor), where:
%
%   - gmId: transistor transconductance over drain current (mS/mA) 
%           (can be a vector).
%   - Vbs:  voltage between transistor body and transistor source (V).
%   - Vds:  voltage between transistor drain and transistor source (V)
%           (can be a vector).
%   - L:    transistor length (um).
%   - flavor: 'n' -> nmos , 'p' -> pmos
%
%   Example
%       gain = Av(1:30, 0, 0.1:0.1:1.8, 0.18, 'n');
%
%   Av(gmId, Vds, L, flavor)
%       same as above but using defaul_vbs (global variable).
%
%   Av(gmId, Vds, flavor)
%       same as above but using default_L (global variable).
%
%
%   See also ro, core_function

    global default_vbs default_L
    if nargin < 3 || 5 < nargin
        error('myApp:argChk', 'Wrong number of input arguments')
    elseif nargin == 3
        gmId    = varargin{1};
        Vbs     = default_vbs;
        Vds     = varargin{2};
        L       = default_L;
        flavor  = varargin{3};
    elseif nargin == 4
        gmId    = varargin{1};
        Vbs     = default_vbs;
        Vds     = varargin{2};
        L       = varargin{3};
        flavor  = varargin{4};
    else
        gmId    = varargin{1};
        Vbs     = varargin{2};
        Vds     = varargin{3};
        L       = varargin{4};
        flavor  = varargin{5};
    end

    y = zeros(length(gmId), length(Vds));
    for i = 1:length(Vds)
        y(:,i) = core_function(['dat.gm_' flavor],gmId,Vbs,Vds(i),L,flavor)./core_function(['dat.gds_' flavor],gmId,Vbs,Vds(i),L,flavor);
    end
end
