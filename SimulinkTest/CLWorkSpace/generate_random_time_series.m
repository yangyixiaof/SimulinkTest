function test_ds = generate_random_time_series(names, specified_data_type, default_data_type, specified_data_shape, default_data_shape, specified_data_range, default_data_range, start_t, gap_t, end_t)
    test_ds = Simulink.SimulationData.Dataset();
    n = length(names);
    for i=1:n
        name = names(i);
        [t_data_type, t_data_shape, t_data_range] = choose_data_type_shape_range(name, specified_data_type, default_data_type, specified_data_shape, default_data_shape, specified_data_range, default_data_range);
        t_data_size = floor((end_t-start_t)/gap_t)+1;
        t_data = zeros([t_data_size, 1]);
        for j=1:t_data_size
            t_data(j, 1) = generate_random_atom(t_data_type, t_data_shape, t_data_range);
            % rand(t_data_shape);
        end
        pos_data = timeseries(t_data, start_t:gap_t:end_t);
        test_ds = test_ds.addElement(pos_data, name);
        % disp(name);
    end
end