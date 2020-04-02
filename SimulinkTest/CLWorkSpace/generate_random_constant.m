function test_ds = generate_random_constant(names, specified_data_shape, default_data_shape)
    test_ds = Simulink.SimulationData.Dataset();
    n = length(names);
    for i=1:n
        name = names(i);
        t_data_shape = default_data_shape;
        if isfield(specified_data_shape,name)
            t_data_shape = specified_data_shape.(name);
        end
        t_data = rand(t_data_shape);
        % disp(class(name));
        test_ds = test_ds.addElement(t_data, name);
        % disp(name);
    end
end
