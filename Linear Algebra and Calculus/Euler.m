function [y,x] = Euler(f,n,x0,xn,y0)

h = (xn - x0)/n;

x = x0:h:xn;  %defines a array of elements starting from x0 to xn with difference of h
y(:,1) = y0;

for i = 1:n
    y(:,i+1) = y(:,i) + h*f(x(i),y(:,i)); 
end

end