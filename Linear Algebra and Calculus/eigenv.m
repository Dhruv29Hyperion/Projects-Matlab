function [vec,diag_val] = eigenv(A)
[M,N] = size(A);
if M ~= N          %since eigen values do not exist for non-square matrices
    disp("The given matrix isn't a square matrix thus invalid.");
    exit;
end

%First we find the eigenvalues.
char = charpoly(A);  %getting the characteristic equation
val = roots(char);    %then you take out the roots of the characteristic equation to find the eigen values.
diag_val = diag(val);    %creates a diagonal matrix of the eigenvalues

%Now we find the eigen vectors.
vec = zeros(N,N);       %initializing the matrix with columns as different eigen vectors

for i = 1:N
    s = val(i);             % a loop to iterate through each eigenvalue
    AI = (A - s*eye(N));    %just making (A - s*I) matrix for each eigenvalue
    AI_reduced = rref(AI);  %we will get a reduced form of the above matrix with the last row being of 0, proving that its not an invertible matrix hence the determinant is 0.
    EV = [-AI_reduced(1:(N-1),N);1];      %initializing my eigen vector corresponding to the chosen eigen value. Setting the last value in the vector as 1 to get direct values of the other unknowns.
    EV = EV/norm(EV);       %to get the normalized version to match matlab's output.
    vec(:,i) = EV;          %adding the obtained eigen vector in the eigenvector matrix for output
end

if det(vec) == 0             %because if true, then the eigen vector matrix is singular and doesn't have an inverse
    disp("The matrix isn't diagonalizable.");
else
    disp("The given matrix is diagonlizable.");
    format rational;
    disp("The matrix with eigenvectors as columns :- ");
    disp(vec);
    disp("The matrix with diagonal entries equal to the eigenvalues :- ");
    disp(diag_val);
end