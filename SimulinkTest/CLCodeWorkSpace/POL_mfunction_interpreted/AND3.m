% ò_óùêœ
function [y] = AND3(u)
    y = logical(u(1)) & logical(u(2)) & logical(u(3));
    y = double(y);
end