function [y] = weak_decr_right(x)
    y = fliplr(weak_incr_left(fliplr(x)));
end

