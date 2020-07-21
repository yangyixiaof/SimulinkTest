%”½“]
function [y] = NOT(u)
    u1 = logical(u);
    if u == false        
        y = true;
    else
        y = false;
    end
    y = double(y);
end