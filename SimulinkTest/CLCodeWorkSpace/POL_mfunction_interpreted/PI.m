% �ϕ�
%   y=Sxdt
%   ���Z�b�g���͂�ON�̂Ƃ��Ay�̓��Z�b�g�l
%       ua�F=u(1);% :����
%       ud=u(2);%�F���Z�b�g����
%       yold=u(3);%�F�O��l
%       set=u(4);%�F���Z�b�g�l
%       timc=u(5);%�F�v�Z���݁@dt
function [y] = PI(u)
       ua = u(1);% :����
       ud=logical(u(2));%�F���Z�b�g����
       yold=u(3);%�F�O��l
       set=u(4);%�F���Z�b�g�l
       timc=u(5);%�F�v�Z���݁@dt

    if ud(1) == true
        y = set;
    else
        y = yold + ua * timc;
    end
end
