f = @(x, y) x + y^2;
n1 = 5; x0 = 0; xn = 0.5; y0 = 0; n2 = 10;

[y1, x1] = Euler(f, n1, x0, xn, y0); %numerical solution
[y2, x2] = Euler(f, n2, x0, xn, y0); %numerical solution

syms t
y_z = dsolve("Dy==t+y^2", "y(0)=0"); %exact solution
y_x1 = double(subs(y_z, t, x1));
y_x2 = double(subs(y_z, t, x2));

error_1 = abs(y_x1 - y1);
error_2 = abs(y_x2 - y2);
Error_1 = error_1';

c = [];

for i = 1:length(x1)
    c(end + 1) = find(x1(i) == x2);
end

Error_2 = error_2(c)';
Ratio = Error_1 ./ Error_2;

x_i = x1'; y_x_i = y_x1'; y_i_1 = y1'; y_i_2 = y2(c)'; Error_1 = error_1';
table(x_i, y_x_i, y_i_1, y_i_2, Error_1, Error_2, Ratio);
