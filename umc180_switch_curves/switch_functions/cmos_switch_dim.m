function [Wn,Wp] = cmos_switch_dim(varargin)

    grap_mode = 0;
    if nargin == 3
        if varargin{3} == 'g';
            grap_mode = 1;
        end
    end
    
    r = varargin{1};
    L = varargin{2};
    
    
    global s_dat
    rmax =  interpn(s_dat.L_n, 1:1:size(s_dat.rmax,2), s_dat.rmax, L,1:1:size(s_dat.rmax,2));
    
    if r > max(rmax) || r < min(rmax)
        error('myApp:argChk', ['Argument out-of-bounds: r must be between ' num2str(min(rmax)) ...
                ' ohms and ' num2str(max(rmax)) ' ohms for L = ' num2str(L) 'u'] )
    else
        Wn_vec = interpn(s_dat.L_n, 1:1:size(s_dat.rmax,2), s_dat.Wn_post, L,1:1:size(s_dat.rmax,2));
        Wp_vec = interpn(s_dat.L_n, 1:1:size(s_dat.rmax,2), s_dat.Wp_post, L,1:1:size(s_dat.rmax,2));
        null_idx = isnan(rmax);
        rmax(null_idx) = [];
        Wn_vec(null_idx) = [];
        Wp_vec(null_idx) = [];

        Wn = interp1q(rmax, Wn_vec', r);
        Wp = interp1q(rmax, Wp_vec', r);
    
        if grap_mode
           rn = switch_r(s_dat.Vin_n,Wn,L,'n');
           rp = switch_r(s_dat.Vin_p,Wp,L,'p');
           
           rcmos = zeros(1, length(rn));
           for i = 1:length(rcmos)
              rcmos(i) = par(rn(i), rp(i)); 
           end
           rmean = mean(rcmos)*ones(1,length(rn));
           rmin = min(rcmos)*ones(1,length(rn));
          
           plot(s_dat.Vin_n, rcmos, s_dat.Vin_n, rn,s_dat.Vin_p, rp,s_dat.Vin_p, rmin,s_dat.Vin_p, rmean,s_dat.Vin_p, r*ones(1,length(rn)))
           axis([s_dat.Vin_n(1) s_dat.Vin_n(end) rmin(1)*0.2 r*2])
           xlabel('$V_{in}$\,(V)','interpreter','LaTeX','FontSize',16)
           ylabel('$R_{on}$\,($\Omega$)','interpreter','LaTeX','FontSize',16)
           legend('Ron cmos', ['Ron nmos, W = ' num2str(Wn) 'um'], ['Ron pmos, W = ' num2str(Wp) 'um'],...
               ['Ron cmos min = ' num2str(rmin(1))], ['Ron cmos mean = ' num2str(rmean(1))], ['Ron cmos max = ' num2str(r)])
        end
    end
end


