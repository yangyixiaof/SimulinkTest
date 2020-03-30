model = 'test';
open_system(model);

% try
%     Simulink.findVars(model);
% catch err
%     disp(err);
% end

vars = find_undefined_variables(model);


