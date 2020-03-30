function undefinedVars = find_undefined_variables(modelName)
    undefinedVars = [];
    stillErrors = 1;
    while stillErrors
        try
            Simulink.findVars(modelName);
            stillErrors = 0;
        catch err
            % If the error is an undefined block parameter then find the name and add it to the list
            leaf_err = track_to_leaf_err(err);
            stillErrors = 0;
            if ~isempty(leaf_err) && (strcmp(leaf_err.identifier,'SLDD:sldd:VarMissingBase'))
                varName = regexp(leaf_err.message,'Variable ''(\w+)''','tokens');
                if ~isempty(varName)
                    undefinedVars = [undefinedVars varName{1}];
                    evalin('base',[varName{1}{1},'=0;']);
                end
                % Display any other errors as usual.
            else
                rethrow(err);
            end
        end
    end
end

function leaf_err = track_to_leaf_err(err)
    leaf_err = err;
    while ~isempty(leaf_err.cause)
        leaf_err = leaf_err.cause{1};
    end
end

