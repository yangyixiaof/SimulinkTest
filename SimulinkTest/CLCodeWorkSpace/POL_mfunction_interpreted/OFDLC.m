% �I�t�f�B���C �^�C�}
%  x��OFF�ƂȂ��Ă���p�����[�^�Őݒ肵��[sec]���y��OFF�ƂȂ�B
%  �Ȃ��Ax��OFF��Ԃ��p�����[�^�Őݒ肵��[sec]��������ON���
%  �֖߂����ꍇ��y��ON��Ԃ��p������B
%       ud=u(1):���͐M��
%       set=u(2)�F���萔
%       timc(1)=u(3)�F�v�Z����
%       timc(2)(u4)�F�o�ߎ���(�O��l)
%       y : �o�͐M��
function[y] = OFDLC(u)
       ud=logical(u(1));      %:���͐M��
       set=u(2);              %�F�Z�b�g����
       timc(1)=u(3);          %�F�v�Z����
       timc(2)=u(4);          %�F�o�ߎ���(�O��l)

    if ud == true
        y = true; 
        w = set;
    else
        if timc(2) > 0 
            y = true;
            w = timc(2) - timc(1);
        else
            y = false;
            w = timc(2);
        end       
    end
    y = [double(y),w];
end