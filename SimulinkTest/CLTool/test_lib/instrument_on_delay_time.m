function [is_code] = instrument_on_delay_time(code,index_of_set)

codes = strsplit(code, '\n');
for i=1:length(codes)
    one = strtrim(codes(i));
    idxs = regexpi(one, '^function\s*[');
    
    s=s+v(i);
end

end

