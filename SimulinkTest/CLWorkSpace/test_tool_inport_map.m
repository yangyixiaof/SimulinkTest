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

vars = find_undefined_variables(model);
names = find_names_of_inports(model);

test_ds = generate_random_time_series(names, specified_data_shape, default_data_shape, Start_time, Stop_time, Sample_time);
save('t.mat', 'test_ds');

close_system(model);






