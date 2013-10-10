function [Wn,Wp] = cmos_switch_dim_rmin(rmin,L)
    
    Wn = switch_dim_rmin(rmin,L,'n');
    Wp = switch_dim_rmin(rmin,L,'p');
    
end

