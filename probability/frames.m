clear; close all; clc
grid_length = 100;
start_pos = randi(100);
curr_pos = start_pos;
xc = 0:1:grid_length;
yc = zeros(1,length(xc));
h = plot(xc,yc,'k','Linewidth',1);
hold on
y1 = yc - 0.05;
for i=0:5:grid_length
    text(i-1,y1(i+1),num2str(i),'color','k')
end
xlim([-2,105])
ylim([-0.2,0.4])
axis off
iteration = 50;
num_hops = 0;
for j = 1:1:iteration
    curr_pos = randi(grid_length);
    x2 = curr_pos;
    num_hops = num_hops + 1;
    plot(x2,0,".",'MarkerSize',20)
    plot([x2,x2],[0.02,0.06],'color','k','LineWidth',1)
    if j == iteration
        text(35,0.3,strcat("Starting Position: ",num2str(start_pos)),'color','k')
        text(37,0.26,strcat("Total Hops: ",num2str(num_hops)),'color','k')
    end
    pause(0.25)
    f = getframe
    plot([x2,x2],[0.02,0.06],'color',"#f0f0f0",'LineWidth',1 )
end
movie(f)