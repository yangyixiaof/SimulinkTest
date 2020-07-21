function [a] = instrument_s_functions(model)
a = 0;

% bcs = Simulink.findBlocks(model,'Name','ONDLC');
% disp(getfullname(bcs));

s_funcs = Simulink.findBlocksOfType(model,'S-Function');
disp(getfullname(s_funcs));

a = getfullname(s_funcs(1));
disp(a);

disp('=== split line ===');

sf = sfroot();
% 'simeventslib/Attributes/Attribute Function/MATLAB Function/ SFunction '
sysAF = find_system(a,'LookUnderMasks','all');
AFsFcn = get(cell2mat(get_param(sysAF,'handle')));
disp(AFsFcn.Path);
HsFcn = sf.find('Path',AFsFcn.Path,'-isa','Stateflow.EMChart');
% disp(HsFcn);
HsFcn.Script = strcat(HsFcn.Script, 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');

save_system(model);

% see 
% a = bcs(3);

% disp(getfullname(a));
% 
% dialogPrms = get_param(a, 'ObjectParameters');
% dialogPrmNames = fieldnames(dialogPrms);
% disp(dialogPrmNames);
% 
% for idx = 1:numel(dialogPrmNames)
%    dialogPrmValue = get_param(a, dialogPrmNames{idx});
%    disp(dialogPrmNames{idx});
%    disp(dialogPrmValue);
% end

% p_n = get_param(a,'FunctionName');
% disp(p_n);

end

