% �����V���b�g �^�C�}
%  x��OFF����ON�ɕω����Ă���p�����[�^�Őݒ肵��[sec]�̊ԁAy��ON�Ƃ���B
%  �Ȃ��Ax��ON��Ԃ��p�����[�^�Őݒ肵��[sec]�ȏ�p�������ꍇ�A���邢�͐ݒ�ȉ�
%  �����p�����Ȃ��ꍇ�ł��Ay��ON��Ԃ̊��Ԃ̓p�����[�^�Őݒ肵�����ԂƂȂ�B
%       ud(1) = u(1) ;:���͐M��
%       yold = u(2) ;:�O��l
%       set = u(3) ;:���萔
%       timc(1) = u(4) ;:�v�Z����
%       timc(2) = u(5) ;:�o�ߎ���
%       y : �o�͐M��
function[y] = OSHOTC(u)
       ud(1) = logical(u(1));
       yold = logical(u(2));
       set = u(3);
       timc(1) = u(4);
       timc(2) = u(5);
       
    if (ud == false) && (yold == false)
        w = 0;
        y = false;
    else
        if set > timc(2)
            y = true;
            w = timc(2) + timc(1);
        else
            y = false;
            w = timc(2);
            if u == false
                w = 0;
            end
        end
    end
    y = [double(y),w];
end