function [y] = weak_incr_left(x)
    y = cumsum([x(1) subplus(diff(x))]);
end

