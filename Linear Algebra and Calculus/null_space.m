%function [N]=null_space(A)
A = [0 0.25 0 0.25 0.25 0.25;0 0 0.5 0.5 0 0;0 0 0 0 1 0;0 0 0 0 1 0;0.5 0 0 0.5 0 0;0 0 0 0 1 0];

B=rref(A);
[m,n]=size(A);
M1=zeros(n);
D=[];

%create the array of total cols
for i=1:n
    D = [D i];
end

%using c_r_space function to extract the pivotol and non-pivotol columns
piv_col=[];
piv_row=[];

i=1;j=1;

for i=i:m
    for j=j:n
        if B(i,j)==1 && nnz(~B(:,j))==m-1
            piv_col = [piv_col j];
            piv_row= [piv_row i];
             break
        end
    end
end

non_piv_col= setdiff(D,piv_col); %contains the non pivotol cols

%For loop in non-piv cols, for col(n), replace the corresponding (n,n)
%element in the alt matrix(M1) with 1.

for i=1:length(non_piv_col)
    a=non_piv_col(1,i);
    M1(a,a)=1;
end

%For loop in pivotal cols, for nth col from matrix B, extract all the
%elements from that row it falls on and replace the elements of nth row in
%matrix B with the negative values extracted from matrix B

for i=1:length(piv_col)
    a=piv_col(1,i); %ith element of piv_cols
    b=piv_row(1,i); %jth element of piv_rows
    for j=1:length(piv_row)       
        for k=1:length(D)
            c=B(b,k);
            M1(a,k)=-c;
        end  
    end
end

%
disp("Null Space")
for i=1:length(non_piv_col)
    a1=non_piv_col(1,i);
    disp(M1(:,a1))
end
N=M1;


