%ò_óùòa
function [y] = OR(u)
    y = logical(u(1)) | logical(u(2));
    y = double(y);
end