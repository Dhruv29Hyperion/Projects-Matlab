lambda = 1;
price = 5;
N = 10^6; % Number of Monte Carlo Steps
claim = zeros(N,1);
for i=1:N
    n = poissrnd(lambda);
    sum = 0;
    if n>0
        money = zeros(n,1);
        for j=1:n
            U = rand(1);
            if U<=2/3
                money(j) = 1;
            else
                money(j) = 2;
            end
        end
        for j=1:n
            sum = sum+money(j);
        end
    end
    if sum>price
        claim(i) = 1;
    else
        claim(i) = 0;
    end
end
success = mean(claim)