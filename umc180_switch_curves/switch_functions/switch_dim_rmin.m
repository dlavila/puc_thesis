function [y] = switch_dim_rmin(r,L,flavor)
    
    global s_dat
    
    if flavor == 'n'
       r_mat = shiftdim(s_dat.r_switch_n(1,:,:));
       r_vec = interpn(s_dat.L_n,s_dat.W_n, r_mat, L,s_dat.W_n);
       y     = interpn(r_vec, s_dat.W_n, r,'linear');
    else
       r_mat = shiftdim(s_dat.r_switch_p(end,:,:));
       r_vec = interpn(s_dat.L_p,s_dat.W_p, r_mat, L,s_dat.W_p);
       y     = interpn(r_vec, s_dat.W_p, r,'linear'); 
    end

end

