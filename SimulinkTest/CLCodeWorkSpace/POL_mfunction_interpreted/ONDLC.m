% �I���f�B���C �^�C�}
%  x��ON�ƂȂ��Ă���p�����[�^�Őݒ肵��[sec]���y��ON�ƂȂ�B
%  �Ȃ��Ax��ON��Ԃ��p�����[�^�Őݒ肵��[sec]��������OFF���
%  �֖߂����ꍇ��y��OFF��Ԃ��p������B
%       ud=u(1) :���͐M��
%       set=u(2)�F���萔
%       timc(1)=u(3)�F�v�Z����
%       timc(2)=u(4)�F�o�ߎ���(�O��l)
%       y : �o�͐M��
function [y] = ONDLC(u)
       ud = logical(u(1));
       set=u(2);
       timc(1)=u(3);
       timc(2)=u(4);
    if ud == false
        y = false;
        w = 0;
    else
        if timc(2) < set 
            y = false;
            w = timc(2) + timc(1);
        else
            y = true;
            w = timc(2);
        end
    end
    y = [double(y),w];
end