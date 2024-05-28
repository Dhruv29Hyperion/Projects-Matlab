function [y,x] = RK_4(f,n,x0,xn,y0)
h = (xn - x0)/n;  %step size
x = x0:h:xn;     %x = linespace(x0,xn,n-1)
y(1) = y0;

for i = 1:n
    k1 = f(x(i),y(i));
    k2 = f(x(i) + h/2,y(i)+h/2*k1);
    k3 = f(x(i) + h/2 , y(i) + h/2*k2);
    k4 = f(x(i) + h/2, y(i) + h*k3);
    y(i+1) = y(i) + h/6*(k1+2*k2+2*k3+2*k4);
end