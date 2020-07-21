clc;
clear;

Start_time = 0;
Stop_time  = 20;
Sample_time = 0.1;

default_data_shape = [1,1];
specified_data_shape = containers.Map();
default_data_type = 'double';
specified_data_type = containers.Map();
default_data_range = [-10,10];
specified_data_range = containers.Map();

test_time = 7200;

model = 'Control_Logic_d';


