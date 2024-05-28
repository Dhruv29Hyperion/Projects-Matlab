mat = [5 -1 1;0 2 4;1 1 5];
b = [10 12 -1]';
tol = 0.00000001;
itr = 100;
x0 = [0 0 0]';
Gauss_Seidel(mat,b,tol,itr,x0);
