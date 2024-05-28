function [x] = Page_Rank(A, d, error)

[~,N] = size(A);        % N is equal to the number of webpages
x = rand(N, 1);        %takes a random vector as the inital rank vector guess.
x = x ./ norm(x, 1);   % Normalizes our vector
cond_x = ones(N, 1) * inf;     %for the condition check below
B = (d .* A) + (((1 - d) / N) .* ones(N, N));

iter = 1;
while (norm(x - cond_x, 2) > error)         %will do it unless th norm_2 of the 2 iterates is less than error
 	cond_x = x;          
	x = B * x;    % swapping mechanism for taking in the new iterate form of x
    iter = iter + 1;
end

fprintf("No. of iterations taken : %d\n",iter);

%Sorting Algorithm
j = [];
[m,~] = size(x);
idx = [1:m]';
aug = [x idx];
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

end


