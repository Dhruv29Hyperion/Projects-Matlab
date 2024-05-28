for k=0:30
    lambda = [2 3 1 3];
    N = 10^4; % Number of Monte Carlo Steps
    claim = [];
    for i=1:N
        total = 0;
        for m = 1:length(lambda)
            n = poissrnd(lambda(m));
            sum = 0;
            if n>0
                money = zeros(n,1);
                for j=1:n
                    U = rand(1);
                    if U <= 2/3
                        money(j) = 1;
                    else
                        money(j) = 2;
                    end
                end
                for j=1:n
                    sum = sum+money(j);
                end
                total = total+sum;
            end
        end
        if total > k
            claim(i) = 1;
        else
            claim(i) = 0;
        end
    end
    success(k+1) = mean(claim);
end
plot(0:30,success,"-*")
title("Simulated graph of k vs P(Z > k)")
xlabel('k')
ylabel('Probability of Z > k')
