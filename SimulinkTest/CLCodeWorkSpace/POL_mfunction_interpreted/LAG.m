%% lag 1���x��
%   function:		PLAG
%    description:	�ꎟ�x��
%	y=(dt�~x+�с~yold)/(dt+��)
%	dt�F���ԍ��݁C�сF���萔�Cyold�F�O��o�͒l
%
%    algorithm:
%	if(init == TRUE)	then
%		AY = Y_old = AX
%	endif
%	AY = (dt*AX+��*Y_old)/(dt+ ��)
%	Y_old = AY

function [y] = LAG(u)
  x = u(1);
  tau = u(2);
  dt = u(3);
  y_old = u(4);
  y = (dt*x+tau*y_old)/(dt+ tau);
end