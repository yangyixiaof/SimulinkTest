%ò_óùòa
function [y] = OR3(u)
    y = logical(u(1)) | logical(u(2)) | logical(u(3));
    y = double(y);
end