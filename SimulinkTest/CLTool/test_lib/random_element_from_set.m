function [ele] = random_element_from_set(ele_set)
    r_t_set_len = length(ele_set);
%     disp(r_t_set_len);
    rp = randperm(r_t_set_len);
%     disp(rp);
    b = ele_set(rp);
    ele = b(1);
end

