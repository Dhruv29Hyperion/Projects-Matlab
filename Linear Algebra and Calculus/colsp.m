function [] = colsp(A)

[m,n] = size(A);

a = 1;
b = 1;
c = 1;

[B,~] = rref(A);


col_sp = [];

for a = a:m
    for b = b:n
        if B(a,b) == 1 && nnz(~B(:,b)) == m - 1
            col_sp(:, c) = A(:,b);
            a = a + 1;
            b = b + 1;
            c = c + 1;
        else
            b = b + 1;
        end
    end
end

disp(col_sp)

