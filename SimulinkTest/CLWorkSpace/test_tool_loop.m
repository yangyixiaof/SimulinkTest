open_system(model);

cov_val = 0.0;
all_cov = [];

t1 = clock;
while 1
    %generate test cases
    vars = find_undefined_variables(model);
    test_ds_const = generate_random_constant(vars, specified_data_shape, default_data_shape);
    transfer_dataset_to_workspace(test_ds_const);

    test_ds = generate_random_time_series(names, specified_data_shape, default_data_shape, Start_time, Stop_time, Sample_time);
    save('t.mat', 'test_ds');
    load('t.mat');
    [cvdo, simOut] = cvsim(model);
    if isempty(all_cov)
        all_cov = cvdo;
    else
        all_cov = all_cov + cvdo;
    end
    cov = decisioninfo(all_cov, model);
    temp_cov_val = 100 * cov(1) / cov(2);
    if temp_cov_val > cov_val
        cov_val = temp_cov_val;
        disp(['Coverage Increased:', cov_val]);
    end
    t2 = clock;
    if t2 - t1 > test_time
        break;
    end
end
% cvhtml('CoverageReport.html', cvdo);

close_system(model);







