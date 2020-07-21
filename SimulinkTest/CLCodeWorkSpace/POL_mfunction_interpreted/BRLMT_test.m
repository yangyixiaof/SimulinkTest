% ���[�g���~�b�^
%   |(x-yold)/dt|���ω����[�g�Ȃ�΁A y=x
%   |(x-yold)/dt|���ω����[�g�Ȃ�΁A y=yold+�ω����[�g
%       u(1)�F���͕ϐ�
%       u(2)�F�ω����[�g
%       u(3)�F�v�Z����
%       yold�F�O��o�͒l
%       y : �o�͕ϐ�
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