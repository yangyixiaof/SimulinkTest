% 除算器
%       u(1), u(2) : 入力変数
%       set=u(3) : FloatMax
%       y : 出力変数
function [y] = DIV(u)
    temp = double(u(2));
    set = u(3);
    err = -1;
    if temp ~= 0
        y = u(1) / u(2);
    else
        y = set; 
    end
end