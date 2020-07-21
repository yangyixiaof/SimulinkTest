% ���[�g���~�b�^
%   |(x-yold)/dt|���ω����[�g�Ȃ�΁A y=x
%   |(x-yold)/dt|���ω����[�g�Ȃ�΁A y=yold+�ω����[�g
%       u(1)�F���͕ϐ�
%       yold=u(2)�F�O��o�͒l
%       set(1)=u(3)�F�ω����[�g
%       set(2)=u(4)�F�v�Z����
%       y : �o�͕ϐ�
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