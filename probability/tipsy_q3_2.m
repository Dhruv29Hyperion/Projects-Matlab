clear;
option = [1 -1];
avg = [];

for start_pos = 1:1:60
    data = [];
    num_hops = 0;
    for itr = 1:1:100
        curr_pos = start_pos;
        while curr_pos ~= 60
            curr_pos = curr_pos + option(randperm(length(option),1));
            num_hops = num_hops + 1;
            if curr_pos == -1
                break
            end
        end
        data(end+1) = num_hops;
    end
    avg(end+1) = mean(data);
end

plot(1:1:60,avg,"-")
table((1:1:60)',avg','VariableNames',['Starting Position',"Average Number of Hops"])