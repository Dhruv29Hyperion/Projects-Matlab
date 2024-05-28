%A = [1 2; 1 2];

%if det(A) == 0
 %   disp("Matrix A is non-singular.")
  %  B = inv(A);
   % disp(B)
%else 
 %   disp("Matrix A is singular.")
%end

A = [1 3 4;5 -9 -8;4 7 8];

B = [1 6 7;-1 -5 1;1 9 0];

[m1,n1] = size(A);
[m2,n2] = size(B);

C = zeros(m1, n2);

for i = 1:m1
    for j = 1:n2
        product = 0;
        for k = 1:n1
            product = product + A(i,k) * B(k,j);
        end
        C(i,j) = product;
    end
end

