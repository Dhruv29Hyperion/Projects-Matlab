lambda = 5;             %itensity of the Poisson Process
N = 10000;               % Number of iterations
beer_price = 350;

beer = zeros(1,N);
sum_exp=[];
sum_arr = [];

for t = 1:20                  %number of hours
    for i = 1:N
        n = poissrnd(lambda*t); % In long run it will return values in such a way that average of all n's will be 14
        if n>0                     % If zero will add no value as array will be index of zero elements
            coins = zeros(n,1)';
            for j = 1:n                % Coins allocation
                U = rand;
                %coins(j) = (U <= 2/5)*5 + (U > 2/5 && U <= 4/5)*10 + (U > 4/5)*20;
                if U<=2/5
                    coins(j)=5;

                elseif U>2/5 && U<=4/5
                    coins(j)=10;
                else
                    coins(j)=20;
                end
            end
        end
        if sum(coins)> beer_price
            beer(i)=1;
        else
            beer(i)=0;
        end
    end
    l_hat = mean(beer);                           % l_hat = P(X3 >= beer_price)
    relErr_hat = std(beer) / (l_hat * sqrt(N));   % relative error of l_hat by crude Monte Carlo simulation
    sum_arr(end+1) = l_hat;
end

plot((1:20),sum_arr);