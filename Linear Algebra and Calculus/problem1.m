A = [1 2 3;3 4 5;5 6 7];
B = [3 4 5;5 6 7;7 8 9];

if size(A) == size(B)
    C = A + B
else
    disp("Matrix summation not possible")
end

[m1,n1] = size(A);
[m2,n2] = size(B);

C = zeros(1);

if m1 == m2 && n1==n2
    for i=1:m1
        for j=1:n1
            C(i,j) = A(i,j) + B(i,j);
        end
    end
    disp(C)
else
    disp("Sum is not possible")
end