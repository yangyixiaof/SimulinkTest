model = 'test';
open_system(model);
sysIns  = find_system(model, 'BlockType', 'Inport');
sysOuts = find_system(model, 'BlockType', 'Outport');
% testObj = cvtest(model);
% testObj.settings.decision = 1;
% paramStruct.AbsTol            = '1e-5';
% paramStruct.SaveState         = 'on';
% paramStruct.StateSaveName     = 'xoutNew';
% paramStruct.SaveOutput        = 'on';
% paramStruct.OutputSaveName    = 'youtNew';

% t = [0; 1; 1; 2];
% i1 = [2; 2; 2; 2];
% i2 = [-1; -1; 1; 1];
% i3 = [3; 3; 3; 3];

% i1.time = [0; 1; 1; 2];
% i1.signals.values = [2; 2; 2; 2];
% i1.signals.dimensions = [];
% i1_signals = struct('values', [2; 2; 2; 2], 'dimensions', [4]);
% i1 = struct('time', [0; 1; 1; 2], 'signals', i1_signals);

% i1 = timeseries([2; 2; 2; 2], [0; 1; 1; 2]);

% i2.time = [0; 1; 1; 2];
% i2.signals.values = [-1; -1; 1; 1];
% i2.signals.dimensions = [];
% i2_signals = struct('values', [-1; -1; 1; 1], 'dimensions', [4]);
% i2 = struct('time', [0; 1; 1; 2], 'signals', i2_signals);

% i2 = timeseries([-1; -1; 1; 1], [0; 1; 1; 2]);

% i3.time = [0; 1; 1; 2];
% i3.signals.values = [3; 3; 3; 3];
% i3.signals.dimensions = [];
% i3_signals = struct('values', [3; 3; 3; 3], 'dimensions', [4]);
% i3 = struct('time', [0; 1; 1; 2], 'signals', i3_signals);

% i3 = timeseries([3; 3; 3; 3], [0; 1; 1; 2]);

% ds = Simulink.SimulationData.Dataset();
% ds = ds.addElement(i1, 'i1');
% ds = ds.addElement(i2, 'i2');
% ds = ds.addElement(i3, 'i3');
% save('t.mat', 'ds');

load('t.mat');

% [cvdo, simOut] = cvsim(model, 'ExternalInput', '[t, i1, i2, i3]');

[cvdo, simOut] = cvsim(model);

cvhtml('CoverageReport.html', cvdo);

% simOut = sim(model, 'ExternalInput', '[i1, i2, i3]');












