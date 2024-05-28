% t = 10;
% N=10^4;
% for lambda=[2,3,1,3]
%     time_dep=zeros(t,1);
%     for claim_amt=0:t
%         claims=zeros(1,N);
%          for i=1:N
%             n=poissrnd(lambda);
% 
%          end
%     end
% end

for lambda = [2,3,1,3]
    exponential = exp(-lambda);
    x = [];
    y = [];
    z = zeros(0,10);
    for k = 1:10
        summation = [];
        for n = ceil(k/2):k
            summation(end + 1) = (exponential*(lambda^n)*(1/3)^(k-n)*((2/3)^(2*n - k)))/(factorial(2*n-k)*factorial(k-n));
        end
        x(end+1) = k;
        y(end+1) = sum(summation)
    end
    hold on
    plot(x,y,"*");
end
legend(["q1","q2","q3","q4"])
hold off

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