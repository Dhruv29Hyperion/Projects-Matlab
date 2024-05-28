function [] = Basis_row(A)

[~,r1] = rref(A);   %using my built r_r_e_function
cond = 0;

for i = 1:r1
    bcr = A(i,:); 
    disp(bcr);
    cond = 1;
end

if cond == 1
    disp("Above rows are the basis of the row space of the inputted matrix");
else
    disp("no basis found.")
end



