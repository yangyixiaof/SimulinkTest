% first phase, set up parameters
addpath('test_lib');

run_info = '';

default_data_dimension = [1, 1];
specified_data_dimension = containers.Map();
default_data_type = 'double';
specified_data_type = containers.Map();
default_data_range = [minimum_data,maximum_data];
specified_data_range = containers.Map();

% second phase, set up config and extract model infomation
open_system(model);
config_set_up(model);
close_system(model);

disp("==== Configurations are set! ====");

open_system(model);
instrument_s_functions(model, s_config);
close_system(model);

disp("==== Files are instrumented! ====");

open_system(model);
find_undefined_variables(model);
vars = find_mutate_variables(model, immutate_vars);
[sysIns, names] = find_names_of_inports(model);
% [specified_data_type, specified_data_shape, specified_data_range] = 
specify_data_type_shape_range(model, sysIns, names, specified_data_type, specified_data_dimension, specified_data_range);
close_system(model);

disp("==== Variables are set! ====");

% close_system(model);

% third phase, running 
% open_system(model);
open_system(model);

cov_val = 0.0;
all_cov = [];

test_dir = 'TestCases';
if exist('TestCases','dir') == 0
    mkdir('TestCases');
end

constant_model = containers.Map;
branch_model = containers.Map;

time_arr = [];
cov_arr = [];

interest_seeds = containers.Map;
namelist = dir(strcat(InitialTestCasesDirectory, '/*.mat'));
for i = 1:length(namelist)
    name_i = namelist(i).name;
    aoe_tsinghua_mhi_data = load(name_i);
    interest_seeds(char(num2str(interest_seeds.Count))) = aoe_tsinghua_mhi_data;
end
disp("==== Initial test cases are loaded! ====");

disp("==== Testing loop begins! ====");
care_seed = [];
care_seed_mutate_times = seed_mutate_times;

t1 = clock;
while 1
    %generate variable test cases
    if mutate_variable
        test_ds_const = generate_random_constant(vars, specified_data_type, default_data_type, specified_data_dimension, default_data_dimension, specified_data_range, default_data_range);
        transfer_dataset_to_workspace(test_ds_const);
    end
    
%     vars = [];
%     for i=1:length(names)
%         var = strcat('test_sig', num2str(i));
%         vars = [vars, string(var)];
%         eval(strcat(var, '=generate_random_time_series(names{i}, specified_data_type, default_data_type, specified_data_shape, default_data_shape, specified_data_range, default_data_range, Start_time, Sample_time, Stop_time);'));
%     end
%     % test_ds = generate_random_time_series(names, specified_data_type, default_data_type, specified_data_shape, default_data_shape, specified_data_range, default_data_range, Start_time, Sample_time, Stop_time);
%     save('t.mat', vars);
    
    if rand (1, 1) > mutate_probability
        aoe_tsinghua_mhi_data = struct();
        aoe_tsinghua_mhi_data.time = (Start_time:Sample_time:Stop_time)';
    %     t = Simulink.SimulationData.Dataset();
        for i=1:length(names)
    %         var = strcat('test_sig', num2str(i));
            name = names(i);
            [t_data_type, t_data_shape, t_data_range] = choose_data_type_shape_range(name, specified_data_type, default_data_type, specified_data_dimension, default_data_dimension, specified_data_range, default_data_range);
            ui = generate_random_time_series(t_data_type, t_data_shape, t_data_range, Start_time, Sample_time, Stop_time, constant_model);
            aoe_tsinghua_mhi_data.signals(i).values = ui;
            aoe_tsinghua_mhi_data.signals(i).dimensions = t_data_shape(2);
    %         u = [u ui];
    %         eval(strcat(var, ' = generate_random_time_series(names{i}, specified_data_type, default_data_type, specified_data_shape, default_data_shape, specified_data_range, default_data_range, Start_time, Sample_time, Stop_time, constant_model);'));
    %         eval(strcat('t = t.addElement(', var, ',''', var, '''', ');'));
        end
    else
        % mutate the existing interesting seed
        if isempty(care_seed)
            care_seed = random_element_from_set(values(interest_seeds));
        end
        
        aoe_tsinghua_mhi_data = mutate_seed(care_seed, care_seed_mutate_times);
        
        care_seed_mutate_times = care_seed_mutate_times - 1;
        if care_seed_mutate_times == 0
            care_seed = [];
        end
    end
%     save('t.mat', 't');

%     load('t.mat');
    ct = cvtest(model);
    ct.settings.decision = 1;
    [cvdo, simOut] = cvsim(ct);
    % handle run info
    [constant_model, branch_model] = parse_branch_info(run_info);
    run_info = '';
    
    if isempty(all_cov)
        all_cov = cvdo;
    else
        all_cov = all_cov + cvdo;
    end
    t2 = clock;
    cost = etime(t2, t1);
    
    cov = decisioninfo(all_cov, model);
    cov_1 = cov(1);
    cov_2 = 100000000;
    if length(cov) >= 2
        cov_2 = cov(2);
    end
    temp_cov_val = 100 * cov_1 / cov_2;
    if temp_cov_val > cov_val
        cov_val = temp_cov_val;
        disp(strcat('Coverage Increased:', num2str(cov_val), '#Running Time:', num2str(cost)));
        f_name = num2str(cost);
        r_f_name = strcat(f_name, '.mat');
        save(r_f_name, 'aoe_tsinghua_mhi_data');
        movefile(r_f_name, test_dir);
        interest_seeds(char(num2str(interest_seeds.Count))) = aoe_tsinghua_mhi_data;
    end
    % disp(cost);
    disp(strcat('== one turn executed, coverage: ', num2str(cov_val), ' == ', 'Running Time:', num2str(cost)), 's == ');
    
    time_arr = [time_arr cost];
    cov_arr = [cov_arr cov_val];
    
    if cost > test_time
        break;
    end
end
cvhtml('CoverageReport.html', all_cov);
save('rt_cov.mat', 'time_arr', 'cov_arr');

close_system(model);











