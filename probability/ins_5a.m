lambda = [2 3 1 3];
N = 10^5; % Number of Monte Carlo Steps
claim = [];
price = 10;
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
    if total>price
        claim(i) = 1;
    else
        claim(i) = 0;
    end
end
success = mean(claim)