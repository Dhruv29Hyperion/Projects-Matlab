function [y,x] = RK_2(f,n,x0,xn,y0)
h = (xn - x0)/n;  %step size
x = x0:h:xn;
y(1) = y0;     %x = linespace(x0,xn,n-1)

for i = 1:n
    k1 = f(x(i),y(i));
    k2 = f(x(i) + h,y(i)+h*k1);
    y(i+1) = y(i) + h/2*(k1+k2);
end