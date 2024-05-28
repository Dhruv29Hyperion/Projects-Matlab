function TrussVisualizer(joints,rods,reactions,loads)

hold on
TrussPlotter(joints,rods,reactions,loads)     %plots the base structure using the already made 
% TrussPlotter function so that the overlapping elements in both the graphs need not be plotted again

T = TrussAnalyser(rods,joints,reactions,loads);  %T stores the tension values for 
% each rod using the TrussAnalyzer function

for i = 1:(length(T)-3)         %since the last elements of T stores the values of the reaction forces,
    % we don't need them
    first_joint = rods(i,2);
    second_joint = rods(i,3);
    x = [joints(first_joint,2) joints(second_joint,2)];
    y = [joints(first_joint,3) joints(second_joint,3)];        %similar to the TrussPlotter, 
    % we store the coordinates of the joints that the concerned rod is between
    if  T(i) > 0                        %plots a blue line if the rod tension is +ve. (tension)
         plot(x,y,'Color','b')
    elseif T(i) == 0
         plot(x,y,'Color','m')          
    else 
        plot(x,y,'Color','r')           %plots a red line if the rod tension is -ve. (compression)
    end
end

for i = 1:(length(T)-3)              %shows the tension values above the rod numbers
    first_joint = rods(i,2);
    second_joint = rods(i,3);
    text((joints(first_joint,2)+joints(second_joint,2))/2,(joints(first_joint,3)+joints(second_joint,3))/2 + 0.3,strcat(num2str(T(i))))
end