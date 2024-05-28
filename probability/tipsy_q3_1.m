clear;
option = [1 -1];
avg = [];

for grid = 10:1:100                %variable grid points
    start_pos = ceil(grid/2);      %fix starting position for each grid length
    data = [];
    for itr = 1:1:100           %100 iterations
        curr_pos = start_pos;
        num_hops = 0;
        while curr_pos ~= grid
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

plot(10:1:100,avg,"-")
table((10:1:100)',avg','VariableNames',["Grid-Length","Average Number of Hops"])



