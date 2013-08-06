function [y] = core_function(var,gmId,Vbs,Vds,L,flavor)
% core_function Core function for gmId functions.
%   core_function(var, gmId, Vbs, Vds, L, flavor) turn the dependent
%   variable gmId in function var into a independente variable replacing 
%   vgs as the independent variable.
%
%   - var: string with the name of the function to evaluate, ej: 'dat.fT_n',
%   where dat is the global struct with the transistors data.
%   - gmId: transistor transconductance over drain current (mS/mA) 
%           (can be a vector).
%   - Vbs:  voltage between transistor body and transistor source (V).
%   - Vds:  voltage between transistor drain and transistor source (V).
%   - L:    transistor length (um).
%   - flavor: 'n' -> nmos , 'p' -> pmos
%
%   Example
%       Id_W_n = core_function('dat.Id_n./dat.W_n', 1:30, 0, 1.8, 0.18, 'n');
%
%   See also Av, ro, C_per_W, fT, Vov, Vth

    global dat
    if flavor == 'n'
        gmId_vec = interpn(dat.Vgs_n,dat.Vbs_n,dat.Vds_n,dat.L_n,dat.gmId_n, dat.Vgs_n,Vbs,Vds,L,'linear');
        gmId_vec = mono_decr_right(gmId_vec',1e-6);
        if min(min(gmId_vec)) <= min(min(gmId)) && max(max(gmId)) <= max(max(gmId_vec))
            y = interpn(gmId_vec,dat.Vbs_n,dat.Vds_n,dat.L_n,eval(var),gmId,Vbs,Vds,L,'linear');
        else
            error('myApp:argChk', ['gmId must be between ' num2str(min(min(gmId_vec))) ' and '  num2str(max(max(gmId_vec)))] )
        end
    else
        gmId_vec = interpn(dat.Vgs_p,dat.Vbs_p,dat.Vds_p,dat.L_p,dat.gmId_p, dat.Vgs_p,Vbs,Vds,L,'linear');
        gmId_vec = mono_decr_right(gmId_vec',1e-6);
        if min(min(gmId_vec)) <= min(min(gmId)) && max(max(gmId)) <= max(max(gmId_vec))
            y = interpn(gmId_vec,dat.Vbs_p,dat.Vds_p,dat.L_p,eval(var), gmId,Vbs,Vds,L,'linear');
        else
            error('myApp:argChk', ['gmId must be between ' num2str(min(min(gmId_vec))) ' and '  num2str(max(max(gmId_vec)))] )
        end
    end
end

