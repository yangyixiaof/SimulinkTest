function names = find_names_of_inports(modelName)
    sysIns = find_system(modelName, 'BlockType', 'Inport');
    % sysOuts = find_system(model, 'BlockType', 'Outport');
    n = length(sysIns);
    names = [];
    for i=1:n
        inport = sysIns{i};
        pos = strfind(inport,'/');
        % disp(pos);
        if length(pos) == 1
            name = inport(pos+1:strlength(inport));
            names = [names name];
        end
    end
end