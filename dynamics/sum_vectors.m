function [final] = sum_vectors(dim,num)

collection = zeros(dim,num);

for i = 1:num
    fprintf("Vector %d Values : \n",i)
    for j = 1:dim
        prompt = sprintf("Enter the respective coefficient of component %d : ",j);
        collection(i,j) = input(prompt);
    end
end

final = [];

for i = 1:dim
    sum = 0;
    for j = 1:num
        sum = sum + collection(j,i);
    end
    final(end+1) = sum;
end

