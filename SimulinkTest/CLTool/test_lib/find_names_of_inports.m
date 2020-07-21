function [sysIns, names] = find_names_of_inports(modelName)
    sysIns = find_system(modelName, 'SearchDepth', 1, 'BlockType', 'Inport');
    % sysOuts = find_system(model, 'BlockType', 'Outport');
    n = length(sysIns);
    names = strings(n);
    for i=1:n
        inport = sysIns{i};
        pos = strfind(inport,'/');
        % disp(pos);
        % assert(length(pos) == 1, strcat('strange! not root inport?', inport));
        name = inport(pos+1:strlength(inport));
        names(i) = string(name);
    end
end
