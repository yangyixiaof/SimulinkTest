%% lag 1xê
%   function:		PLAG
%    description:	êxê
%	y=(dt~x+Ñ~yold)/(dt+Ñ)
%	dtFÔÝCÑFèCyoldFOñoÍl
%
%    algorithm:
%	if(init == TRUE)	then
%		AY = Y_old = AX
%	endif
%	AY = (dt*AX+Ñ*Y_old)/(dt+ Ñ)
%	Y_old = AY

function [y] = LAG(u)
  x = u(1);
  tau = u(2);
  dt = u(3);
  y_old = u(4);
  y = (dt*x+tau*y_old)/(dt+ tau);
end