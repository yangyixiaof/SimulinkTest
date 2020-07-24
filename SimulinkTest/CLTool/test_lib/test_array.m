
a = [1 2 3 4;5 6 7 8];
disp(size(a));

b = 1.4;
rb = int32(round(b));
disp(rb);
disp(class(rb));

c = struct('cluster',[1 2]);
c(2) = struct('cluster',[1 2;3 4]);
disp(c);

ii = rand (1, 1);
if ii > 0.5
    disp(ii);
else
    disp(strcat(num2str(ii), '=='));
end

disp('==== split line ====');

d = [];
disp(isempty(d));
d = struct('a', [1 2]);
disp(isempty(d));

a = struct('a', 1, 'b', 2);
b = a;
b.('a') = 3;
b.('b') = 4;
disp(a);
disp(b);











