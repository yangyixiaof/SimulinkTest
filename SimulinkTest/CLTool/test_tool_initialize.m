addpath('test_lib');

run_info = '';

default_data_shape = [1,1];
specified_data_shape = containers.Map();
default_data_type = 'double';
specified_data_type = containers.Map();
default_data_range = [-10,10];
specified_data_range = containers.Map();

test_time = 10;

model = 'Control_Logic_e';

mutate_variable = 0;

%set parameters here%

Start_time = 0;
Stop_time = 20;
Sample_time = 0.1;

immutate_vars = ["Start_time","Stop_time","Sample_time"];


