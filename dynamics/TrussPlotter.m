%plots a truss
function TrussPlotter(joints,rods,reactions,loads) %#ok<INUSL> 
drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0 );  %initialized the drawArrow function that 
% will used to plot arrows based on the difference of the two points
num_rods = size(rods,1);             %the next three variables stores the no. of rods, joints and load reaction
num_joints = size(joints,1);
num_reactions = size(reactions,1);
num_loads = size(loads,1);
clf;
hold on
axis off
plot(joints(:,2),joints(:,3),'o') %plot the x-y coordinate of the joints.
for i = 1:num_joints            %plots the joint no. at its respective point
    text(joints(i,2) - 0.05,joints(i,3)-0.1,strcat("Joint ",num2str(i)))
end
for i = 1:num_rods
    first_joint = rods(i,2);   %stores the first joint no. that the rod is between
    second_joint = rods(i,3);     %stores the other joint no. 
    x = [joints(first_joint,2) joints(second_joint,2)];    %stores the coordinates of the concerned joints to plot
    y = [joints(first_joint,3) joints(second_joint,3)];
    plot(x,y,'Color','k')
    text((joints(first_joint,2)+joints(second_joint,2))/2,(joints(first_joint,3)+joints(second_joint,3))/2,strcat("Rod ",num2str(i)))
    %plots the rod number in the middle of the rod
end

for i = 1:num_reactions
    x = [joints(reactions(i,1),2) joints(reactions(i,1),2)];
    y = [joints(reactions(i,1),3) joints(reactions(i,1),2)-10];
    drawArrow(x,y);
end

for i = 1:num_loads
    if loads(i,2) > 0 %then arrow right direction
        x = [joints(loads(i,1),2) joints(loads(i,1),2) + 3];  %will be plotted 3 units right in x-direction
        y = [joints(loads(i,1),3) joints(loads(i,1),3)];
        drawArrow(x,y)
        text(joints(loads(i,1),2)+0.02,joints(loads(i,1),3)-1,strcat("W",num2str(i)))
    end

    if loads(i,2) < 0 %then left direction
        x = [joints(loads(i,1),2) joints(loads(i,1),2) - 3];   %plots an arrow 3 units left in x-direction
        y = [joints(loads(i,1),3) joints(loads(i,1),3)];
        drawArrow(x,y)
        text(joints(loads(i,1),2)+0.02,joints(loads(i,1),3)-1,strcat("W",num2str(i)))
    end
    if loads(i,3) > 0 %then upwards       
        x = [joints(loads(i,1),2) joints(loads(i,1),2)];
        y = [joints(loads(i,1),3) joints(loads(i,1),3)+3];     %plots an arrow 3 units upwards
        drawArrow(x,y)
        text(joints(loads(i,1),2)+0.02,joints(loads(i,1),3)-1,strcat("W",num2str(i)))
    end        
    if loads(i,3) < 0  %then downwards
        x = [joints(loads(i,1),2) joints(loads(i,1),2)];     %similar in principle, just 3 units downwards
        y = [joints(loads(i,1),3) joints(loads(i,1),3)-3];
        drawArrow(x,y)
        text(joints(loads(i,1),2)+0.02,joints(loads(i,1),3)-1,strcat("W",num2str(i)))
    end
end


    