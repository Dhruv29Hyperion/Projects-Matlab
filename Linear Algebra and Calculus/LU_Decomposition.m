function [Lm,Um,x] = LU_Decomposition(A,b)

[~,n] = size(A);
L = zeros(n);
U = zeros(n);

for a = 1:n   %converts the diagonal entries of L as 1. This is for Dolittle Method. In Crout's, diagonal entries of U are 1. In Cholesky's, both the diagonal entries of L and U are same.
    L(a,a) = 1;
end

U(1,:) = A(1,:); % U first row is same as A's first row
L(:,1) = A(:,1)/U(1,1);   %when you write the matrices in equation form, you will see the logic. For L's first column

for i = 2:n  %starting from 2 because we have already caluculate 1st row/col above.
    for j = i:n    %for calculating U.Row starts from U(j,j) element
        U(i,j) = A(i,j) - L(i,1:i-1)*U(1:i-1,j);
    end
    for k = i+1:n %starts from i+1 because when you notice the equations, you will see it using values from the below row
        L(k,i) = (A(k,i) - L(k,1:i-1)*U(1:i-1,i))/U(i,i);
    end
end
Lm = L;
Um = U;

Y = zeros(n,1);
Y(1) = b(1)/L(1,1);

for k = 2:n
    Y(k) = (b(k) - L(k,1:k-1)*Y(1:k-1))/L(k,k);
end

X = zeros(n,1);
X(n) = Y(n)/U(n,n);

for k = n-1:-1:1
    X(k) = (Y(k) - U(k,k+1:n)*X(k+1:n))/U(k,k);
end
x = X;