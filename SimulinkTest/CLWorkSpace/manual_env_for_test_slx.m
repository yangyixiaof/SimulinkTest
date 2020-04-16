clc;
clear;

% signals
i1 = timeseries([2; 2; 2; 2], [0; 1; 1; 2]);
i2 = timeseries([-1; -1; 1; 1], [0; 1; 1; 2]);
i3 = timeseries([3; 3; 3; 3], [0; 1; 1; 2]);

%parameters
abc = 0;
Start_time = 0;
Stop_time = 2;
Sample_time = 0.1;

if exist('t_test.mat','file')
    load('t_test.mat')
end




