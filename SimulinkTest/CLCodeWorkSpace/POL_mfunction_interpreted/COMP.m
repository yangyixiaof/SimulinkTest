% �ݒ�l��r
%   x��Set�Ȃ�΁A y��ON
%   x��Set�Ȃ�΁A y��OFF
%       u=u(1) : ���͕ϐ�
%       Set=u(2) : ���͕ϐ�
%       y : �o�͕ϐ�
function [y] = COMP(u)
    set = u(2);
    if u(1) >= set
        y = true;
    else
        y = false; 
    end
    y = double(y);
end