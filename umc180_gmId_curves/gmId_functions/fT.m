function [y] = fT(varargin)
% fT Transistor transit frequency (Hz), defined as 1/(2*pi)*gm/Cgg.
%   fT(gmId, Vbs, Vds, L, flavor) returns 1/(2*pi)*gm/Cgg for a given
%   set (gmId, Vbs, Vds, L, flavor), where:
%
%   - gmId: transistor transconductance over drain current (mS/mA) 
%           (can be a vector).
%   - Vbs:  voltage between transistor body and transistor source (V).
%   - Vds:  voltage between transistor drain and transistor source (V).
%   - L:    transistor length (um).
%   - flavor: 'n' -> nmos , 'p' -> pmos
%
%   Example
%       f = fT(1:30, 0, 1.8, 0.18, 'n');
%
%   fT(gmId, Vds, L, flavor)
%       same as above but using defaul_vbs (global variable).
%
%   fT(gmId, L, flavor)
%       same as above but using defaul_vds (global variable).
%
%   fT(gmId, flavor)
%       same as above but using defaul_L (global variable).
%
%   See also C_per_W, core_function

    global default_vbs default_vds default_L
    if nargin < 2 || 5 < nargin
        error('myApp:argChk', 'Wrong number of input arguments')
    elseif nargin == 2
        gmId    = varargin{1};
        Vbs     = default_vbs;
        Vds     = default_vds;
        L       = default_L;
        flavor  = varargin{2};
    elseif nargin == 3
        gmId    = varargin{1};
        Vbs     = default_vbs;
        Vds     = default_vds;
        L       = varargin{2};
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
    y = core_function(['dat.fT_' flavor],gmId,Vbs,Vds,L,flavor);
end

