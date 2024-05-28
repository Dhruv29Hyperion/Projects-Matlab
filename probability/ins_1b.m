p=1/3;
lambda=3;
final=0;
for k=0:5
    prob = p^k*(1-p)^(-k)*exp(-lambda);
    sum = 0;
    for n=ceil(k/2):k
        sum = sum + (p^(-n)*(lambda*(1-p)^2)^n)/(factorial(k-n)*factorial(2*n-k));
    end
    prob = prob*sum;
    final = final + prob;
end
disp(1-final);
