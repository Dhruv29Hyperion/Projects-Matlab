f = @(x,y) x;
n = 1000;
x0 = 0;
y0 = 0;
xn = 2;

[y,x] = Euler(f,n,x0,xn,y0);

syms t
z = dsolve("Dy == t","y(0) = 0");
xy = double(subs(z,t,x));
error = double(abs(y-xy));

x_i = x';
y_i = y';
z_i = xy';
Error = error';

T = table(x_i,y_i,z_i,Error);

hold on
scatter(x,y,"m")
plot(x,y,"b");
ezplot(z,[x0,xn])
scatter(x,xy,"r")
lgd = legend("Discrete Numerical Sol (y_i)","Numerical Soln(y_i)","Exact Sol (y(x))","Discrete Exact Soln y(x_i)");
pos = lgd.location;
lgd.location = "northwest";
title("Euler's Method")
hold off