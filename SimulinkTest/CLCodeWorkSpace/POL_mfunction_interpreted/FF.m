% �t���b�v�t���b�v
%  �Z�b�g���͂�ON�̂Ƃ��Ay��ON
%  ���Z�b�g���͂�ON�̂Ƃ��Ay��OFF
%  �Z�b�g���́A���Z�b�g���͋���ON�܂���OFF�̂Ƃ��͑O��l��ێ�
%       yold=u(3):�O��l
%       set(1)=u(1):�Z�b�g�M��
%       set(2)=u(2)�F���Z�b�g�M��
%       y : �o�͐M��
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