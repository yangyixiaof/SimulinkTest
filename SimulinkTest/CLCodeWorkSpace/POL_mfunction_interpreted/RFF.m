% ���Z�b�g�D��t���b�v�t���b�v
%  �Z�b�g���͂�ON�̂Ƃ��Ay��ON
%  ���Z�b�g���͂�ON�̂Ƃ��Ay��OFF
%       set(1)=u(1):�Z�b�g�M��
%       set(2)=u(2)�F���Z�b�g�M��
%       y : �o�͐M��
function [y] = RFF(u)
    set(1)=logical(u(1));
    set(2)=logical(u(2));
    y = false;
    if set(1) == true && set(2) == false
        y = true;
    end
    y = double(y);
end