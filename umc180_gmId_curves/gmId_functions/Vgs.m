function [y] = Vgs(varargin)
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

    y = Vth(gmId,Vbs,Vds,L,flavor) + Vov(gmId,Vbs,Vds,L,flavor);
end


