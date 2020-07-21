% フリップフロップ
%  セット入力がONのとき、yはON
%  リセット入力がONのとき、yはOFF
%  セット入力、リセット入力共にONまたはOFFのときは前回値を保持
%       yold=u(3):前回値
%       set(1)=u(1):セット信号
%       set(2)=u(2)：リセット信号
%       y : 出力信号
function [y] = FF(u)
    set(1) = logical(u(1));
    set(2) = logical(u(2));
    yold = logical(u(3)); 
    y = yold;
    if (set(1) == false) && (set(2) == true)
        y = false;
    else
        if (set(1) == true) && (set(2) == false)
            y = true;
        end
    end
    y = double(y);
end