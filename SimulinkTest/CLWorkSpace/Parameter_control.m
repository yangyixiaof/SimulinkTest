%% This is parameter list for control logic

Aset_N1 = 2;    % Door_open_pressure timer[sec]
Aset_N2 = 30;   % Door open pressure[kPa] 
Aset_N3 = 3;    % Full_open_timer[sec]
Aset_N4 = 5;    % Full_close_timer[sec]

Aset_N5 = 1;    % Control reference door position at opening state [m]
Aset_N6 = 0;    % Control reference door position at closing state [m]

Aset_N7 = 0.01;  % Door position error[m]
%% gain for position control
Aset_N8 = 2;  % Gain
Aset_N9 = 0.1;  % Time constant

%% gain for velocity control
% Aset_N8 = 1;  % Gain
% Aset_N9 = 1;  % Time constant

Aset_N10 =-10;  % Control_limiet_up [%]
Aset_N11 =10;   % Control_limiet_low [%]
Aset_N12 =20;   % Control output upper rate [%/s]
Aset_N13 =20;   % Control output down rate [%/s]

Dset_N1 = 1;    % Manual control permint ON: permit, OFF: not permit
Dset_N2 = 1;    % Control mode ON: position control, OFF: velocity control


%% Initial state for logic
State_OND_T_OND		=0;
State_OND_T_OND1	=0;
State_OND_T_OND2	=0;
State_OND_T_OND3	=0;
State_OND_T_OND4	=0;
State_OND_T_OND8	=0;
State_OFD_T_OFD		=0;
State_OFD_T_OFD1	=0;
State_OST_T_OST1	=0;
State_OST_T_OST2	=0;
State_OST_T_OST3	=0;
State_OST_T_OST4	=0;
State_OST_T_OST5	=0;
State_OST_T_OST6	=0;
State_OST_T_OST7	=0;
State_OST_T_OST8	=0;
State_OST_T_OST9	=0;
State_OST_T_OST10	=0;
State_OST_T_OST11	=0;
State_OST_T_OST12	=0;
State_OST_T_OST13	=0;
State_OST_T_OST14	=0;
State_OST_T_OST15   =0;
State_OST_T_OST16   =0;
State_SSR_SSR       =0;     % Emergency_state
State_SSR_SSR1      =0;     % Wating_state
State_SSR_SSR2      =0;     % Opening state     
State_SSR_SSR3      =0;     % Cloging state
State_SSR_SSR4      =0;     % Control_stop_state
State_SSR_SSR5      =0;     % Emergency_state