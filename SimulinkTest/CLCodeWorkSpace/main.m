%% This is Parameter of Control Logic

%% Initialize

clear all
clc

%% Simulation setting
Start_time = 0;             % Simulation start time[sec]
Stop_time = 200;            % Simulation stop time [sec]
Sample_time = 0.1;          % POL sampling time [sec]

Ini_time = Start_time;      % Start time [sec]
%% Parameter setting for control logic model

Parameter_control

%% Initial state for control logic model
%State_SSR = 0;              % SSR(Reset-set Flip Flop) state
%State_SRR = 0;              % SRR(Set-Reset Flip Flop) state

%State_OND_T = 0;            % On Delay Timer time state
%State_OFD_T = 0;            % Off Delay Timer time state

%State_OST_T = 0;
%% Parameter setting for plant model
Door_mass = 3; %Door mass[kg]
Door_c = 50; % Door Damping[N/m/s]
Door_k = 1000;

%% Initial state for plant model
Ini_x = 0;      % Door initial position [m]
Ini_v = 0;      % Door initial velocity [m/s]

%% Initial state for logic
Parameter_control
