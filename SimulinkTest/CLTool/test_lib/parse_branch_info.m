function [ constant_model, branch_model ] = parse_branch_info( rinfo )
    constant_model = containers.Map;
    branch_model = containers.Map;
    rs = strsplit(rinfo, '$');
    for i=1 : length(rs)
        r = rs(1, i);
        r = char(r);
        if ~isempty(r)
%             disp(class(r));
            b_info = strsplit(r, '#');
%             disp(b_info);
            branch = char(b_info(1));
            if length(b_info) == 2
                if ~constant_model.isKey(branch)
                    constant_model(branch) = [];
                end
                tb_v = str2double(char(b_info(2)));
                constant_model(branch) = [constant_model(branch); tb_v];
            else
                if ~branch_model.isKey(branch)
                    branch_model(branch) = [];
                end
                v1 = str2double(char(b_info(2)));
                v2 = str2double(char(b_info(3)));
                branch_model(branch) = [branch_model(branch); [v1, v2]];
            end
        end
    end
    key_set = keys(constant_model);
    for i=1:length(key_set)
        key = key_set{i};
        uniqued_consts = unique(constant_model(key));
        constant_model(key) = uniqued_consts;
    end
%     disp(pmodel('a'));
end

