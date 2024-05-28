function T = TrussAnalyser(rods,joints,reactions,loads)        %uses the Method of Joints to evaluate the Tension in each rod
%returns vector T of unknown tensions + reaction forces

%the variables stores the no. of rods, joints, reaction forces, and loads
num_rods = size(rods,1);
num_joints = size(joints,1);
num_reactions = size(reactions,1);
num_loads = size(loads,1);

A = zeros(2*num_joints);    %Initializes the A matrix that store the cosines and sines of bar angles
L = zeros(2*num_joints,1);  %Is a list of negative of loads applied in the x and y direction of the joint

for i = 1:num_rods
    first_joint = rods(i,2);     %store first joint no. that the rod is between
    second_joint = rods(i,3);    %store the other joint no.
    x = joints(second_joint,2) - joints(first_joint,2);
    y = joints(second_joint,3) - joints(first_joint,3);    %both of the above calculates the 
    % distance between the coordinates in 2D
    rod_length = sqrt(x^2 + y^2);     %calculates the rod length by taking out the 
    % square root of the squares of the calculated dist.
    c = x/rod_length;     %cos = base/hypotenuse
    s = y/rod_length;      %sin = perpendicular/hypotenuse
    A(2*first_joint-1,i) = c;      % x comp of pull direction on base
    A(2*(first_joint),i) = s;      % y comp of pull direction on base
    A(2*second_joint-1,i) = -c;       % x comp of pull direction on tip
    A(2*(second_joint),i) = -s;        % y comp of pull direction on tip
end

%stores the reaction values in respective direction at the rightmost columns of A matrix
for i = 1:num_reactions
    rxn_joint = reactions(i,1);
    A(2*rxn_joint-1,i+num_rods) = reactions(i,2);
    A(2*rxn_joint,i+num_rods) = reactions(i,3);
end

%Just to store the negatives of the loads in the [L] vector for future
%calculation
for i = 1:num_loads
    load_joint = loads(i,1);
    L(2*load_joint-1) = -loads(i,2); 
    L(2*load_joint) = -loads(i,3);

end
T = A\L    %based on [A][T] = [L]