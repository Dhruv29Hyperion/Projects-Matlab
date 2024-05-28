A = [1 3 4; 5 -9 -8; 4 7 8];
B = [1 6 7; -1 -5 1; 1 9 0];
size(A);
size(B);
sum = A + B;
difference = A - B;
product = A*B;
complex = A*(A -2*B);
A(1:2 , :);
B(: , 1:2);
X = inv(A);
Y = inv(B);
det(A);
det(B);
det(X);
det(Y);
C = transpose(A);
C(1,3)
C(2:2 , :);
det(C)