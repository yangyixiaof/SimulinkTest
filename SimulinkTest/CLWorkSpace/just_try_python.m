order = py.dict(pyargs('soup',3.57,'bread',2.29,'bacon',3.91,'salad',5.00));

abc = "abcd[sd]";

order{abc} = "ajsjac";

disp(string(order{abc}));

order{abc} = [-1, -2];

disp(double(order{abc}));

order = py.dict(pyargs());

disp(order);

% disp(isjey(order, "emppp"));





