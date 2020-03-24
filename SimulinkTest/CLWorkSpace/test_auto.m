


model = 'test';
open_system(model);
testObj = cvtest(model);                    % Get test data
testObj.settings.decision = 1;
paramStruct.
% paramStruct.AbsTol            = '1e-5';
% paramStruct.SaveState         = 'on';
% paramStruct.StateSaveName     = 'xoutNew';
% paramStruct.SaveOutput        = 'on';
% paramStruct.OutputSaveName    = 'youtNew';
[cvdo,simOut] = cvsim(testObj, paramStruct); % Get coverage
cvhtml('CoverageReport.html', cvdo);        % Create HTML Report






