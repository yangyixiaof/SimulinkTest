% â‘Î’l
function [y] = ABS(u)
    if u > 0
        y = u(1);
    else
        y = -u(1);
    end
end