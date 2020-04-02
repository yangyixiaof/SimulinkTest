function [specified_data_type, specified_data_shape] = specify_data_type_and_shape(modelName, sysIns, names, specified_data_type, specified_data_shape)
    eval([modelName,'([],[],[],''compile'');'])
    for i=1:length(sysIns)
        h = get_param(sysIns{i},'Porthandles');
        val = get_param(h.Outport,'CompiledPortDataType');
        disp(val);
        disp('====');
%         dialogPrms = get_param(sysIns(i), 'DialogParameters');
%         for idx = 1:numel(dialogPrms)
%             dialogPrm = dialogPrms{idx};
%             dialogPrmNames = fieldnames(dialogPrm);
%             dialogPrmName = dialogPrmNames{idx};
%             dialogPrmValue = get_param(sysIns(i), dialogPrmName);
%             disp(dialogPrmName);
%             disp(dialogPrmValue);
%         end
%         % dimensions = get_param(sysIns(i),'CompiledPortDimensions');
%         % dataTypes = get_param(sysIns(i),'CompiledPortDataTypes');
%         % disp(dimensions);
%         % disp(dataTypes);
%         disp('==== ====');
    end
    eval([modelName,'([],[],[],''term'')'])
end


