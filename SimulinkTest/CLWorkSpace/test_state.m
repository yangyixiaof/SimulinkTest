model = 'Simulation_Model';
open_system(model);

% try
%     Simulink.findVars(model);
% catch err
%     disp(err);
% end

vars = find_undefined_variables(model);

close_system(model);




