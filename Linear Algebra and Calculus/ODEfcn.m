function dydt = ODEfcn(t,x)
dydt = zeros(2,1);
dydt(1) = 1*x(1)*(1 - x(1)/1000) - 0.01*x(1)*x(2);
dydt(2) = 0.005*x(1)*x(2) - 0.5*x(2);
end