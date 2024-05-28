Grid_Length=[];
Avg_Number_Of_Hops=[]; 

for i=1:60
    Number_Of_Hops=[];
    Grid_Length(i)=i;
    for j=1:1000
        startpos=ceil(i/2);
        no_of_hops=0;
        newpos=startpos;
        while true
            if newpos==i
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
        Avg_Number_Of_Hops(i)=AVG/1000;
    end
end

syms n
hold on
Grid_Length=Grid_Length';
Avg_Number_Of_Hops=Avg_Number_Of_Hops';
ques4b=table(Grid_Length,Avg_Number_Of_Hops)
plot(Grid_Length,Avg_Number_Of_Hops)
fplot(n*n/2-n/2*n/2,[1,60]) % Equation nm - m^2 where m=n/2 
hold off

