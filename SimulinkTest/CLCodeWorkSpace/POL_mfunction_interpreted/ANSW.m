% 2位置(アナログ)スイッチ
%   u3入力がONならば、 y=x1(A入力を選択)
%   u3入力がOFFならば、 y=x2(B入力を選択)
%       u(2):A入力変数
%       u(3):B入力変数
%       u3=u(1):C入力変数
%       y : 出力変数
function [y] = ANSW(u)
    temp = logical(u(1));
    if temp ~= false
        y = u(2);
    else
        y = u(3); 
    end