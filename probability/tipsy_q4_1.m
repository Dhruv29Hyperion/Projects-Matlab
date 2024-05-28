Start_Position=[];
Avg_Number_Of_Hops_1000=[]; 
Avg_Number_Of_Hops_100=[]; 


for i=1:60
    Number_Of_Hops=[];
    Start_Position(i)=i;
    for j=1:1000
        startpos=i;
        no_of_hops=0;
        newpos=startpos;
        while true
            if newpos==60
                Number_Of_Hops(j)=no_of_hops;
                break
            end
            if newpos==0
                Number_Of_Hops(j)=no_of_hops;
                break
            end
            left_right=randi(2);
            if left_right==1
                newpos=newpos-1;
            elseif left_right==2
                newpos=newpos+1; 
            end
            no_of_hops=no_of_hops+1;
        end
        AVG=0;
        for k=1:length(Number_Of_Hops)
            AVG=AVG+Number_Of_Hops(k);
        end
        Avg_Number_Of_Hops_1000(i)=AVG/1000;
    end
end


for i=1:60
    Number_Of_Hops=[];
    for j=1:100
        startpos=i;
        no_of_hops=0;
        newpos=startpos;
        while true
            if newpos==60
                Number_Of_Hops(j)=no_of_hops;
                break
            end
            if newpos==0
                Number_Of_Hops(j)=no_of_hops;
                break
            end
            left_right=randi(2);
            if left_right==1
                newpos=newpos-1;
            elseif left_right==2
                newpos=newpos+1; 
            end
            no_of_hops=no_of_hops+1;
        end
        AVG=0;
        for k=1:length(Number_Of_Hops)
            AVG=AVG+Number_Of_Hops(k);
        end
        Avg_Number_Of_Hops_100(i)=AVG/100;
    end
end

hold on
syms m 
Start_Position=Start_Position';
Avg_Number_Of_Hops_1000=Avg_Number_Of_Hops_1000';
Avg_Number_Of_Hops_100 = Avg_Number_Of_Hops_100';
ques4a = table(Start_Position,Avg_Number_Of_Hops_100,Avg_Number_Of_Hops_1000)
plot(Start_Position,Avg_Number_Of_Hops_1000)
syms m
fn = 60*m - m*m;
fplot(fn, [1,60])
hold off

theory = [];
for i = 1:1:60
    theory(end+1) = subs(fn,m,i);
end

discrepancy_100 = abs(theory' - Avg_Number_Of_Hops_100);
discrepancy_1000 = abs(theory' - Avg_Number_Of_Hops_1000);
discrepancy = table(Start_Position,discrepancy_100,discrepancy_1000)
hold on
plot(Start_Position,discrepancy_100,"black")
plot(Start_Position,discrepancy_1000,"red")
lgd = legend("Discrepancy after 100 iterations","Discrepancy after 1000 iterations")
hold off



