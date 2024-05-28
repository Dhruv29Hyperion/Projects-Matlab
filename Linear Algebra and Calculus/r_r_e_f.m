function [B,rank1] = r_r_e_f(A)
[imax,jmax] = size(A);
rank1 = 0;

i = 1;
j = 1;

while  i <= imax && j <= jmax
    [p,k] = max(abs(A(i:imax,j)));  %p is the maximum value and k is its position
    k = k+i-1;
    if p <= 0.00000000001 || p == 0         %testing non-zero
        j = j + 1;
    else
        rank1 = rank1 + 1;
        C = A(k,:);   %row swaping
        A(k, :) = A(i, :);
        A(i, :) = C;
        A(i,:) = A(i,:)./A(i,j); %making pivot equal to 1
        for m = 1:imax
            if m ~= i
                A(m, :) = A(m, :) - A(m,j).*A(i, :);     %making non pivot element equal to 0
            end
        end
        i = i + 1; %for all rows
        j = j + 1; %for all columns
    end
end

%disp(rank);
B = A; %rref of the matrix