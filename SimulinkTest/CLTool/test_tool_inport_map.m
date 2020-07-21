%%
% sysIns = find_system(model, 'BlockType', 'Inport');
% % sysOuts = find_system(model, 'BlockType', 'Outport');
% ds = Simulink.SimulationData.Dataset();
% n = length(sysIns);
% for i=1:n
%     inport = sysIns{i};
%     pos = strfind(inport,'/');
%     % disp(pos);
%     if length(pos) == 1
%         name = inport(pos+1:strlength(inport));
%         t_data_shape = default_data_shape;
%         if isfield(specified_data_shape,name)
%             t_data_shape = specified_data_shape.(name);
%         end
%         t_data = zeros([1,floor((Stop_time-Start_time)/Sample_time)+1]);
%         for j=Start_time:Sample_time:Stop_time
%             t_data(0,j) = rand(t_data_shape);
%         end
%         pos_data = timeseries(t_data, Start_time:Sample_time:Stop_time);
%         ds = ds.addElement(pos_data, name);
%         % disp(name);
%     end
% end
% save('t.mat', 'ds');

open_system(model);

instrument_s_functions(model);

find_undefined_variables(model);
vars = find_mutate_variables(model, immutate_vars);
[sysIns, names] = find_names_of_inports(model);
[specified_data_type, specified_data_shape, specified_data_range] = specify_data_type_shape_range(model, sysIns, names, specified_data_type, specified_data_shape, specified_data_range);

% for i=1:length(names)
%     eval(strcat('test_sig', num2str(i), '=generate_random_time_series(names{i}, specified_data_type, default_data_type, specified_data_shape, default_data_shape, specified_data_range, default_data_range, Start_time, Sample_time, Stop_time);'));
% end

t = Simulink.SimulationData.Dataset();
% save_vars_cmd = 'save(''t.mat''';
for i=1:length(names)
    var = strcat('test_sig', num2str(i));
    % save_vars_cmd = strcat(save_vars_cmd, ',''', var, '''');
    eval(strcat(var, '=generate_random_time_series(names{i}, specified_data_type, default_data_type, specified_data_shape, default_data_shape, specified_data_range, default_data_range, Start_time, Sample_time, Stop_time, containers.Map);'));
    eval(strcat('t = t.addElement(', var, ',''', var, '''', ');'));
end
% save_vars_cmd = strcat(save_vars_cmd, ');');
% eval(save_vars_cmd);
save('t.mat', 't');

close_system(model);






