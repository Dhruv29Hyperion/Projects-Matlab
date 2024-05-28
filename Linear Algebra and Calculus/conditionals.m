n = 10;

if rem(n,2) ==0
    disp("Number is even")
else
    disp("Number is odd")
end

A = [1 2 3;3 4 5;1 4 5];
[m,n] = size(A);
if m ==n
    disp("Matix is square")
else
    disp("Matric is not a square")
end

n = 10;
sum = 0;
i = 1;
while i <= n
    sum = sum+i;
    i = i +1;
end
disp(sum)
