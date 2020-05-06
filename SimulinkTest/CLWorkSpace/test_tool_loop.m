open_system(model);

cov_val = 0.0;
all_cov = [];

t1 = clock;
while 1
    %generate test cases
    test_ds_const = generate_random_constant(vars, specified_data_type, default_data_type, specified_data_shape, default_data_shape, specified_data_range, default_data_range);
    transfer_dataset_to_workspace(test_ds_const);
    
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
        eval(strcat(var, '=generate_random_time_series(names{i}, specified_data_type, default_data_type, specified_data_shape, default_data_shape, specified_data_range, default_data_range, Start_time, Sample_time, Stop_time);'));
        eval(strcat('t = t.addElement(', var, ',''', var, '''', ');'));
    end
    % save_vars_cmd = strcat(save_vars_cmd, ');');
    % eval(save_vars_cmd);
    save('t.mat', 't');

    load('t.mat');
    ct = cvtest(model);
    ct.settings.condition = 1;
    [cvdo, simOut] = cvsim(ct);
    disp('== one turn executed ==');
    
    if isempty(all_cov)
        all_cov = cvdo;
    else
        all_cov = all_cov + cvdo;
    end
    cov = conditioninfo(all_cov, model);
    temp_cov_val = 100 * cov(1) / cov(2);
    if temp_cov_val > cov_val
        cov_val = temp_cov_val;
        disp(strcat('Coverage Increased: ', num2str(cov_val)));
    end
    t2 = clock;
    cost = etime(t2, t1);
    % disp(cost);
    if cost > test_time
        break;
    end
end
cvhtml('CoverageReport.html', all_cov);

close_system(model);







