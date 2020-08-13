% parameters for testing model
model = 'Control_Logic_e';

%set parameters here%
% if ~exist('Start_time', 'var')
    Start_time = 0;
% end
% if ~exist('Stop_time', 'var')
    Stop_time = 200;
% end
% if ~exist('Sample_time', 'var')
    Sample_time = 1;
% end

% testing tool parameters
test_time = 120;

mutate_variable = 0;
seed_mutate_times = 2;

minimum_data = -10;
maximum_data = 10;

InitialTestCasesDirectory = "TestCases";
mutate_probability = 0.5;
simple_taint_analysis_probability = 0.5;

immutate_vars = ["Start_time","Stop_time","Sample_time"];

s_config = {["ONDLC" "u" "2" "[0 1]"], ["OFDLC" "u" "2" "[0 1]"], ["OSHOTC" "u" "2" "[0 1]"], ["#" "#" "#" "#"]};



