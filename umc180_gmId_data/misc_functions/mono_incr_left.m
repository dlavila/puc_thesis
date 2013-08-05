function [y] = mono_incr_left(x,delta)
    diffArr = subplus(diff(x));
    diffArr(diffArr == 0) = delta;
    y = cumsum([x(1) diffArr]);
end

