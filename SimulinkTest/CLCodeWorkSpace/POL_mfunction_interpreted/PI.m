% 積分
%   y=Sxdt
%   リセット入力がONのとき、yはリセット値
%       ua：=u(1);% :入力
%       ud=u(2);%：リセット入力
%       yold=u(3);%：前回値
%       set=u(4);%：リセット値
%       timc=u(5);%：計算刻み　dt
function [y] = PI(u)
       ua = u(1);% :入力
       ud=logical(u(2));%：リセット入力
       yold=u(3);%：前回値
       set=u(4);%：リセット値
       timc=u(5);%：計算刻み　dt

    if ud(1) == true
        y = set;
    else
        y = yold + ua * timc;
    end
end
