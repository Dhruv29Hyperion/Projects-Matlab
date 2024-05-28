f = @(x,y) x^2*y;
n = 5;
x0 = 0;
xn = 2;
y0 = 1;
[y,x] = Euler(f,n,x0,xn,y0);

syms t
y_z = dsolve("Dy == t^2*y","y(0)=1");
y_x = double(subs(y_z,t,x));
error = double(abs(y_x-y));
x_i = x';
y_i = y';
z_i = y_x';
Error = error';
%table(x_i,y_i,z_i,Error)
scatter(x,y);
hold on 
plot(x,y)
ezplot(y_z,[x0,xn]);
scatter(x,y_x,'*');
xlim auto
ylim auto
title("Euler's Method");
lgd = legend("y_i","y_i(x)","y(x)","y(x_i)");
lgd.Location="northwest";
hold off
