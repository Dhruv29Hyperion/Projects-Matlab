k = 0;
Hops = [];
Iteration_Number = [];
Average_Number_of_Hops = 0;

while k <= 30
    Iteration_Number(end+1) = k;
    k = k+1;
    startpos = 30;
    no_of_hops = 0;
    newpos = startpos;
    while true
        %start and end points of the circular track
        if newpos == 60
            %no_of_hops
            Hops(end+1) = no_of_hops;
            Average_Number_of_Hops = Average_Number_of_Hops + no_of_hops;
            break
        end
        if newpos == 0
            %no_of_hops
            Hops(end+1) = no_of_hops;
            Average_Number_of_Hops = Average_Number_of_Hops + no_of_hops;
            break
        end
        %Random function that choses between right or left
        left_right = randi(2);
        if left_right == 1
            newpos = newpos - 1;
        elseif left_right == 2
            newpos = newpos+1;
        end
        no_of_hops = no_of_hops+1;
    end
end

Iteration_Number=Iteration_Number';
Hops=Hops';
Average_Number_of_Hops = Average_Number_of_Hops/k
ques2 = table((Iteration_Number),(Hops))
