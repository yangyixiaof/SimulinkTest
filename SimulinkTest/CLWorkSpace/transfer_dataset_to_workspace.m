function []=transfer_dataset_to_workspace(ds)
    element_list = getElementNames(ds);
    ele_num = length(element_list);
    for i=1:ele_num
        e_name = element_list(i);
        c_val = get(ds,e_name);
        eval([e_name,'=',c_val,';']);
    end
end