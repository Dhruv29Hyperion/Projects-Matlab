p=1/3;
hold on
for k=0:10
    for lambda = 1:3
        prob_theory(k+1,lambda) = p^k*(1-p)^(-k)*exp(-lambda);
        sum = 0;
        for n=ceil(k/2):k
            sum = sum + (p^(-n)*(lambda*(1-p)^2)^n)/(factorial(k-n)*factorial(2*n-k));
        end
        if k==0
            continue
        end
        prob_theory(k+1,lambda) = prob_theory(k,lambda)+prob_theory(k+1,lambda)*sum;
    end
end
prob_theory = 1 - prob_theory;
plot(0:10,prob_theory,"-o")
