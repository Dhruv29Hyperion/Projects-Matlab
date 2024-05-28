A = [-3 1;1 1];
B = [-2;10];

sol = inv(A)*B;   %to find the value of x and y in a system of equations

y = A\B;      %more efficient way

C = [-2 1;4 -2];   %is singular thus no solution
D = [-4;8]; 

%sol1 = C\D;

E = [1 1 1 0; 1 0 1 1;0 1 1 1;1 1 0 1];
F = [7 8 9 10]';

Sol2 = E\F

AugA = [E F];

rref(AugA)