% see = parse_branch_info('Last_True#1$b#3#4$a#7#8$');
% disp(random_from_set([1,2,3,4]));

model = 'test';
open_system(model);
a = instrument_s_functions(model);

close_system(model);

