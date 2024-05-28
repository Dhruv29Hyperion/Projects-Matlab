% Given Conditions
% lambda = [2, 3, 1, 3];         % Poisson intensities for each quarter
% p1 = 2/3;                      % Probability to claim 100,000
% p2 = 1/3;                      % Probability to claim $200,000
% N = 1000000;                   % Number of simulations
% 
% for i = 1:size(lambda)
% 
%     Nj = poissrnd(lambda(i),[N 4]);
% 
%     X = rand(size(Nj));
%     X(Nj==0) = 0;
%     X(Nj~=0 & X <= p1) = 1;
%     X(Nj~=0 & X > p1 & X <= (p1+p2)) = 2;
%     X(Nj~=0 & X > (p1+p2)) = 0;
% 
%     % aggregate of claims
%     Yj = sum(X, 2);
% 
%     % Probabilities of Yj = k
%     k_values = 0:10;  %k = 0, 1, ..., 10
%     P_Yj_k = zeros(size(k_values));
%     for j = 1:length(k_values)
%         count = sum(Yj == k_values(j));
%         P_Yj_k(j) = count/N;
%     end 
% end
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
plot(0:10,prob_theory,"*")

clear
clc
t=10;
N=10^4;
for lambda=[2,3,1,3]  
    time_dep=zeros(t,1);
    for claim_amt=0:t
        
        claims=zeros(1,N);
        
        for i=1:N
            n=poissrnd(lambda);
            if n>=0                 
                claim_var=zeros(1,n);
                for j=1:n
                    U=rand();
                    if U<= 2/3
                        claim_var(j)=1;
                    else
                        claim_var(j)=2;
                    end
                end
            end
            if sum(claim_var) > claim_amt
                claims(i)=1;
            else
                claims(i)=0;
            end
        end
        l_hat=mean(claims);
        relErr_hat=std(claims)/(l_hat*sqrt(N));
        time_dep(claim_amt+1)=l_hat;
    end
    plot((0:10),time_dep)
    hold on
end
title("Theoretical vs Simulated graph for Yj = k")
xlabel('k')
ylabel('Probability of Yj > k')
legend("Sim1","Sim2","Sim3","Sim4", "Ana1","Ana2","Ana3","Ana4")
hold off







