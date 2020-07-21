% 高低モニタ
%   x＞高側設定値ならば、 yをON
%   x＜低側設定値ならば、 yをON
%   上記以外ならばyをOFF
%       u=u(1) :入力変数
%       set(1)=u(1)：低側設定値
%       set(2)=u(3)：高側設定値
%       y : 出力変数
function [y] = HLM(u)
    u1 = u(1);
    set(1) = u(2);
    set(2) = u(3);
    if (u1 > set(1)) || (u1 < set(2))
        y= true;
    else
        y = false; 
    end
    y = double(y);
end