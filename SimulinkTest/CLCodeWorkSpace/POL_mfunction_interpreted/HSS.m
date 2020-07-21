% ‚’l‘I‘ğŠí
function [y] = HSS(u)
    y = u(1);
    if u(2) > y 
        y = u(2);
    end
end
