% binomial pmf
n=100; p = 0.5; 
x = 0:n;
y = binopdf(x,n,0.5);
figure, bar(x,y,1);
xlabel('Observables');
ylabel('Probability mass function');
set(gca,'FontSize',60);
