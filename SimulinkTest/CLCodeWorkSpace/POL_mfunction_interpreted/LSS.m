% ��l�I����
function [y] = LSS(u)
    y = u(1);
    if u(2) < y 
        y = u(2);
    end
end
