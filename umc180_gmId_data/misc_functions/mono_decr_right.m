function [y] = mono_decr_right(x,delta)
    y = fliplr(mono_incr_left(fliplr(x),delta));
end

