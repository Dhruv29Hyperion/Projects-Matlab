clear;
%Plotting the circle
center = [0 0]; 
r = 8;
angle = 0:.01:2*pi;
X = r.*cos(angle)+ center(1);         %for normal radians, 'cos' is used
Y = r.*sin(angle)+ center(2);
hold on
plot(X,Y,'color','#f0f0f0')

title("Tipsy hopping on a Circular Track","FontSize",12)

%plotting the number labels
theta=linspace(0,360,61);            
R = 9;
u = R*cosd(theta)+center(1);               %this is in terms of degrees so cos of degrees is 'cosd' function
v = R*sind(theta)+center(2);
for i=1:1:60
    text(u(i),v(i),num2str(i),'color','k')
end
axis equal

R = 10;
a = R*cosd(theta)+center(1);
b = R*sind(theta)+center(2);

option = [1 -1];
start_pos = 10;
curr_pos = start_pos;
num_hops = 0;
axis off
while curr_pos ~= 0
    curr_pos = curr_pos + option(randperm(length(option),1));
    num_hops = num_hops + 1;
    if curr_pos == 0
        plot(a(60),b(60),".",'MarkerSize',20)
    else
        plot(a(curr_pos),b(curr_pos),".",'MarkerSize',20)
    end
    if curr_pos == 0
        text(-1,0,strcat("Starting Position: ",num2str(start_pos)),'color','k')
        text(-1,2,strcat("Total Hops: ",num2str(num_hops)),'color','k')
    end
    pause(0.1)
    f = getframe;
    if curr_pos ~= 0
        plot(a(curr_pos),b(curr_pos),".",'MarkerSize',20,'color',"#f0f0f0")
    end
end
movie(f)

% 2nd ques
% Number of simulations * 30 with number of hops, store number of hops in array
% and average of hops in a tabular form .. Start pos =30 and grid length 60 also give throretical
% explanation as given in class

% 3rd Ques
% gridlength fixed pos, starting position ( 1-60) with number of hops in a
% tabular format
% Start pos n/2 grid length changes from 2-100
%gridlength is the number of points on the circle


