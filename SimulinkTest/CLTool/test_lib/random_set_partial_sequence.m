function [ ] = random_set_partial_sequence( t_data, t_set, f_set )
    Sample_time = evalin('base', 'Sample_time');
    ll = length(t_data);
    i = round(rand());
    start = 1;
    while i < 100
        m = rem(i, 2);
        if m == 0
            s = int32(random_element_from_two_sets(f_set, randi([1, 5]))/Sample_time, 1);
        else
            s = int32(random_element_from_two_sets(t_set, randi([1, 5]))/Sample_time, 1);
        end
        e_end = start + s - 1;
        if e_end >= ll
            e_end = ll;
        end
        t_data(start : e_end) = m;
        start = e_end + 1;
        i = i + 1;
        if start > ll
            break;
        end
    end
    
%     ll = length(t_data);
%     sf_l = ll - f_l;
%     t_l_satisfied = 0;
%     if t_l > 0 
%         if t_l <= sf_l
%             t_end = sf_l - t_l;
%             start = randi([1,t_end],1,1);
%             t_data(start:start+t_l-1) = 1;
%             t_l_satisfied = 1;
%         else
%             t_l_satisfied = 2;
%         end
%     end
%     if t_l_satisfied == 1
%         if f_l > 0
%             f_start = start+t_l-1;
%             st = randi([f_start,sf_l],1,1);
%             t_data(st:st+f_l-1) = 0; %#ok<NASGU>
%         end
%     else
%         if t_l_satisfied == 2
%             if f_l > 0
%                 if t_1 > 0
%                     % randomly satisfy t_l or f_l
%                     
%                 else
%                     % satisfy f_l
%                     
%                 end
%             else
%                 % satisfy t_l
%                 
%             end
%         end
%     end
end

