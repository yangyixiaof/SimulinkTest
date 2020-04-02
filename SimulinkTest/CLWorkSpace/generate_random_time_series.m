function test_ds = generate_random_time_series(names, specified_data_type, default_data_type, specified_data_shape, default_data_shape, start_t, gap_t, end_t)
    test_ds = Simulink.SimulationData.Dataset();
    n = length(names);
    for i=1:n
        name = names(i);
        t_data_shape = default_data_shape;
        if isfield(specified_data_shape,name)
            t_data_shape = specified_data_shape.(name);
        end
        t_data_size = floor((end_t-start_t)/gap_t)+1;
        t_data = zeros([t_data_size, 1]);
        for j=1:t_data_size
            t_data(j, 1) = rand(t_data_shape);
        end
        pos_data = timeseries(t_data, start_t:gap_t:end_t);
        test_ds = test_ds.addElement(pos_data, name);
        % disp(name);
    end
end