% 2�ʒu(�A�i���O)�X�C�b�`
%   u3���͂�ON�Ȃ�΁A y=x1(A���͂�I��)
%   u3���͂�OFF�Ȃ�΁A y=x2(B���͂�I��)
%       u(2):A���͕ϐ�
%       u(3):B���͕ϐ�
%       u3=u(1):C���͕ϐ�
%       y : �o�͕ϐ�
function [y] = ANSW(u)
    temp = logical(u(1));
    if temp ~= false
        y = u(2);
    else
        y = u(3); 
    end