% レートリミッタ
%   |(x-yold)/dt|＜変化レートならば、 y=x
%   |(x-yold)/dt|≧変化レートならば、 y=yold+変化レート
%       u(1)：入力変数
%       u(2)：変化レート
%       u(3)：計算刻み
%       yold：前回出力値
%       y : 出力変数
function [y, delta] = BRLMT2(u, yold)
    delta = (u(1) - yold) / u(3);
    if (delta < u(2)) && (delta > -u(2))
        y = u(1);
    else
        if delta >= 0 
            y = yold + u(2) * u(3);
        else
            y = yold - u(2) * u(3);
        end
    end