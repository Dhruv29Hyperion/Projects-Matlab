function [C, rank]=c_r_space(A)

[m, n] = size(A);
B=rref(A);
C=[];
D=[];

rank=0;

for i=1:m
    for j=1:n
        if B(i,j)==1 && nnz(~B(:,j))==m-1
            C= [C j];
            D = [D i];
            rank = rank+1;
             break
        end
    end
end
fprintf("rank = %d\n", rank)

fprintf("Column space: \n")
for a=1:length(C)
    a1=C(1,a);
    disp(A(:,a1))
end

fprintf("Row Space: \n")
for b=1:length(D)
    b1=D(1,b);
    disp(B(b1,:))
end




                    
            
            
        
            




         
