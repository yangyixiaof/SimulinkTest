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

t1 = clock;
while 1
    %generate variable test cases
    if mutate_variable
        test_ds_const = generate_random_constant(vars, specified_data_type, default_data_type, specified_data_shape, default_data_shape, specified_data_range, default_data_range);
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

    t = Simulink.SimulationData.Dataset();
    % save_vars_cmd = 'save(''t.mat''';
    for i=1:length(names)
        var = strcat('test_sig', num2str(i));
        % save_vars_cmd = strcat(save_vars_cmd, ',''', var, '''');
        eval(strcat(var, ' = generate_random_time_series(names{i}, specified_data_type, default_data_type, specified_data_shape, default_data_shape, specified_data_range, default_data_range, Start_time, Sample_time, Stop_time, constant_model);'));
        eval(strcat('t = t.addElement(', var, ',''', var, '''', ');'));
    end
    % save_vars_cmd = strcat(save_vars_cmd, ');');
    % eval(save_vars_cmd);
    save('t.mat', 't');

    load('t.mat');
    ct = cvtest(model);
    ct.settings.condition = 1;
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
    
    cov = conditioninfo(all_cov, model);
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
        copyfile('t.mat', strcat(f_name, '.mat'), 'f');
        movefile(strcat(f_name, '.mat'), test_dir);
    end
    % disp(cost);
    disp(strcat('== one turn executed, coverage: ', num2str(cov_val), ' =='));
    
    time_arr = [time_arr cost];
    cov_arr = [cov_arr cov_val];
    
    if cost > test_time
        break;
    end
end
cvhtml('CoverageReport.html', all_cov);
save('rt_cov.mat', 'time_arr', 'cov_arr');

close_system(model);







