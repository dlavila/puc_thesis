function [y] = switch_r(Vin,W,L,flavor)
% switch_r 
%
%   - vin:
%   - W:  voltage between transistor drain and transistor source (V).
%   - L:    transistor length (um).
%   - flavor: 'n' -> nmos , 'p' -> pmos
%
%   Example
%       R = switch_r();
%
%   See also 

    global s_dat
    if flavor == 'n'
        y = interpn(s_dat.Vin_n, s_dat.L_n, s_dat.W_n, s_dat.r_switch_n, Vin, L, W);
    else
        y = interpn(s_dat.Vin_p, s_dat.L_p, s_dat.W_p, s_dat.r_switch_p, Vin, L, W);
    end
end


