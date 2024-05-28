function [] = Gauss_Seidel(A,b,Tol,itr,x0)

[m,n] = size(A);   

D = zeros(m);  %initializing the Diagonal, Upper Triangular and Lower Triangular Matrices
L = zeros(m);
U = zeros(m);

cond = 1;     %setting the true value as 1 which will be used to make the program efficient and not run unnecesary loops

for i = 1:m        %checking for diagonal dominance to see for rate of convergence
    for j = 1:n
        store = 0;
        if i ~= j
            store = store + abs(A(i,j));
        end
    end
    if abs(A(i,i)) < store
        disp("The matrix is not diagonally dominant. Lesser chance of convergence.")
    end
end

if m ~= n 
    disp("Invalid no. of equations for the variables");    %doesn't work for non-square matrix
    cond = 0;
else
    for i = 1:m        %now we divide the matrix in : A = L + D + U;
       for j = 1:n
           if i < j
              U(i,j) = A(i,j);     %stores the upper-triangular matrix
           elseif i > j
              L(i,j) = A(i,j);      %stores the lower triangular matrix
           else
              D(i,j) = A(i,j);     %store the diagonal matrix
           end
       end
    end
end

s = 1;

if cond == 1
    while s <= itr
         x1 = inv(D + L)*(b - U*x0);     %works on the basis of : x = (D + L)^-1(b - U*x0)
         chk = x1 - x0;
         comp = norm(chk,"inf");     
         if comp < Tol                 %checks for the tolerance
             disp(x1);
             disp(s);
             return;
         end
         x0 = x1;         %stores the (k+1)th of the matrix in kth form
         s = s + 1;
    end
    disp("Method fails to converge to given tolerance in given number of iteration!!")
end



