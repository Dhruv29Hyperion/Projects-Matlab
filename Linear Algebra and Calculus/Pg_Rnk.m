function [vec] = Pg_Rnk(A,Tol,x0,N)

counter = 1;
j = [];             %for the condition check below to avoid webpages with same rank_values having different ranks

while counter <= N
    x1 = A*x0;
    x2 = A*x1;
    [~,k1] = max(abs(x1));
    [~,k2] = max(abs(x2));
    a = x2./x2(k2,1) - x1./x1(k1,1);
    if norm(a,"Inf") < Tol
        vec = x2;
        [m,~] = size(vec);   %Sorting Algorithm Begins
        idx = [1:m]';
        aug = [vec idx];
        sort_vec = sortrows(aug,1,'descend');
        for i = 1:m
            if ~ismember(i,j)        %checks if i isn't in the repeated pagenumber list
                fprintf("The rank of webpage %d : %d\n",sort_vec(i,2),i);
                if i < m
                    for z = i+1:m
                    if sort_vec(i,1) == sort_vec(z,1)
                        fprintf("The rank of webpage %d is also : %d\n",sort_vec(z,2),i);
                        j = [j z];       %sets j to webpage with the same value as the previous 
                    end
                    end
                 end
            end
        end
        return;
    end
    counter = counter + 1;
    x0 = x1;
end

disp("Method fails to converge to given tol in given number of iterations!! Pls enter a bigger iteration limit.");