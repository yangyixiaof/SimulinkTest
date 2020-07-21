% 設定値比較
%   x≧Setならば、 yをON
%   x＜Setならば、 yをOFF
%       u=u(1) : 入力変数
%       Set=u(2) : 入力変数
%       y : 出力変数
function [y] = COMP(u)
    set = u(2);
    if u(1) >= set
        y = true;
    else
        y = false; 
    end
    y = double(y);
end