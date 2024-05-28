function[answer] = Gauss_Jord(A,b)

u = length(A);

[B1,r1] = r_r_e_f(A);

aug = [A b];
[B2,r2] = r_r_e_f(aug);

[m,n] = size(aug);

sol = [zeros(u)];

if (r1 ~=r1)
    disp("Inconsistent Solution - No solution");
elseif (r1 == r2) && (r1 == u)
    disp("Consistent Solution - Unique Solution : ");
    sol = B2(:,n);
else
    disp("Consistent Solution - Infinetely Many Solution");
end

answer = sol;
