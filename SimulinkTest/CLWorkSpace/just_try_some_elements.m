t1=clock;

a = 1;
b = 1;
c = 1;
for i = a:b:c
    disp(i);
end
disp(floor((c-a)/b)+1);

eval('yyx = 1;yzzjdslm=2;');

a = zeros([2,1]);
disp(a(2,1));
pause(1);

t2=clock;
tt = etime(t2,t1);
disp(tt);

disp(intmax("int8"));
disp(intmin("int8"));

disp(randi([0,1],[6,1]))
disp("====");
disp(randi([intmin("int8"),intmax("int8")],[6,1]))


