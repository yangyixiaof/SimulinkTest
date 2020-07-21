% レートリミッタ
%   |(x-yold)/dt|＜変化レートならば、 y=x
%   |(x-yold)/dt|≧変化レートならば、 y=yold+変化レート
%       u(1)：入力変数
%       yold=u(2)：前回出力値
%       set(1)=u(3)：変化レート
%       set(2)=u(4)：計算刻み
%       y : 出力変数
function [y] = BRLMT(u)
    yold = u(2);
    set(1)= u(3);
    set(2)= u(4);
    delta = (u(1) - yold) / set(2);
    if (delta < set(1)) && (delta > -set(1))
        y = u(1);
    else
        if delta >= 0 
            y = yold + set(1) * set(2);
        else
            y = yold - set(1) * set(2);
        end
    end
end