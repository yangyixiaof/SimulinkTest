% ���Ⴢ�j�^
%   x�������ݒ�l�Ȃ�΁A y��ON
%   x���ᑤ�ݒ�l�Ȃ�΁A y��ON
%   ��L�ȊO�Ȃ��y��OFF
%       u=u(1) :���͕ϐ�
%       set(1)=u(1)�F�ᑤ�ݒ�l
%       set(2)=u(3)�F�����ݒ�l
%       y : �o�͕ϐ�
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