% see = parse_branch_info('Last_True#1$b#3#4$a#7#8$');
% disp(random_from_set([1,2,3,4]));

model = 'test';
s_config = {[".*fcn$" "u" "2"], ["#" "#" "#"]};

open_system(model);
instrument_s_functions(model, s_config);
close_system(model);

% a = [1 2 3 4];
% b = [a(1:2) 5 a(3:4)];
% disp(b);

% one = "function p  = fcn(u)\np = 0;\nif u(1) < 50\np = 40;\nelse\nif u(2) == 50\np = 600;\nend\np = p + 60;\nend\nend";
% two = "p  = fcn(u)\n";
% idxs = regexpi(two, '^function((\s+\S+)|(\s*[))');
% disp(idxs);

% is = regexp('fcn','#','match');
% disp(isempty(is));
% disp(is);
