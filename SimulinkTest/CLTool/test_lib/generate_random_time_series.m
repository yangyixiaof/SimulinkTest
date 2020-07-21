function test_sig = generate_random_time_series(name, specified_data_type, default_data_type, specified_data_shape, default_data_shape, specified_data_range, default_data_range, start_t, gap_t, end_t, constant_model)
    % test_ds = Simulink.SimulationData.Dataset();
    % out_t_data = [];
    % n = length(names);
    % for i=1:n
    % name = names(i);
    [t_data_type, t_data_shape, t_data_range] = choose_data_type_shape_range(name, specified_data_type, default_data_type, specified_data_shape, default_data_shape, specified_data_range, default_data_range);
    t_data_size = floor((end_t-start_t)/gap_t)+1;
    t_data = [];
    for j=1:t_data_size
        t_data = [t_data; generate_random_atom(t_data_type, t_data_shape, t_data_range)];
        % rand(t_data_shape);
    end
    switch (t_data_type)
        case {"single", "double"}
            
        case {"int8", "uint8", "int16", "uint16", "int32", "uint32", "int64", "uint64"}
            
        case {"boolean"}
            t_set = [];
            if isKey(constant_model, 'Last_True')
                t_set = constant_model('Last_True');
            end
            f_set = [];
            if isKey(constant_model, 'Last_False')
                f_set = constant_model('Last_False');
            end
            random_set_partial_sequence(t_data, t_set, f_set);
        otherwise
            assert(0, strcat("strange error! uncognized type:", t_data_type));
    end
    
    eval_cmd = strcat(t_data_type, '(t_data)');
    % disp(eval_cmd);
    type_parsed = eval(eval_cmd);
    test_sig = timeseries(type_parsed, start_t:gap_t:end_t);
    % out_t_data = test_sig;
    % test_ds = test_ds.addElement(pos_data, name);
    % disp(name);
    % end
end
