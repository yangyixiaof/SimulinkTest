% リセット優先フリップフロップ
%  セット入力がONのとき、yはON
%  リセット入力がONのとき、yはOFF
%       set(1)=u(1):セット信号
%       set(2)=u(2)：リセット信号
%       y : 出力信号
function [y] = RFF(u)
    set(1)=logical(u(1));
    set(2)=logical(u(2));
    y = false;
    if set(1) == true && set(2) == false
        y = true;
    end
    y = double(y);
end