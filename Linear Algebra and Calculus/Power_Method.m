function [eval,evec]= Power_Method(A,Tol,x0,N)

counter = 1;

while counter <= N
    x1 = A*x0;
    x2 = A*x1;
    [~,k1] = max(abs(x1));
    [~,k2] = max(abs(x2));
    a = x2./x2(k2,1) - x1./x1(k1,1);
    if norm(a,"Inf") < Tol
        fprintf("The Iteration at which the condition is met : %d\n",counter);
        evec = x2./x2(k2,1);
        disp(evec);
        disp("Eigen Value = ")
        eval = x2(k2,1)/x1(k1,1);
        disp(eval);
        return;
    end
    counter = counter + 1;
    x0 = x1;
end

disp("Method fails to converge to given tol in given number of iterations.");