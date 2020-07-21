%% lag 1次遅れ
%   function:		PLAG
%    description:	一次遅れ
%	y=(dt×x+τ×yold)/(dt+τ)
%	dt：時間刻み，τ：時定数，yold：前回出力値
%
%    algorithm:
%	if(init == TRUE)	then
%		AY = Y_old = AX
%	endif
%	AY = (dt*AX+τ*Y_old)/(dt+ τ)
%	Y_old = AY

function [y] = LAG(u)
  x = u(1);
  tau = u(2);
  dt = u(3);
  y_old = u(4);
  y = (dt*x+tau*y_old)/(dt+ tau);
end