nodes = [1 0 0; 2 2 0; 3 4 0;4 2 2; 5 0 4;6 4 4];
bars = [1 1 2;2 2 3;3 1 4;4 4 5;5 2 4;6 3 4;7 3 6;8 4 6;9 5 6;10 1 5];
reactions = [1 1 0;3 1 0;3 0 1];
loads = [2 0 200];

% nodes = [1 0 0; 2 2 0; 3 4 0; 4 6 0; 5 5 1; 6 3 1; 7 1 1];
% bars = [1 1 2; 2 2 7; 3 2 3; 4 2 6; 5 3 4; 6 3 6; 7 5 4; 8 5 6; 9 6 7; 10 1 7; 11 3 5];
% reactions = [1 1 0; 1 0 1; 3 0 1];    %[1 1 1; 3 0 1]
% loads = [2 0 4000];

% nodes = [1 0 0; 2 1 0; 3 0 4; 4 1 4; 5 0 8; 6 1 8; 7 0 12; 8 1 12; 9 0 16; 10 1 16; 11 1 14];
% bars = [1 1 2; 2 1 3; 3 1 4; 4 2 4; 5 3 4; 6 3 5; 7 3 6; 8 4 6; 9 5 6; 10 5 7; 11 5 8; 12 6 8; 13 7 8; 14 7 9; 15 7 11; 16 8 11; 17 9 11; 18 10 11; 19 9 10];
% reactions = [1 1 0; 1 0 1; 3 0 1];
% loads = [10 500 0];

% theta = pi/9;                   % specify theta in radians
% alpha1 = atan(3*tan(theta));     % calculate alpha1
% alpha2 = atan(2*tan(theta));    % calculate alpha2 from arctan
% alpha3 = theta;                 % calculate alpha3 from arctan
% S3 = sin(alpha3);
% F1 = 20;
% F2 = 40;

% nodes = [1 0 10; 2 9 10; 3 12.93 .5707; 4 18 10; 5 27 10; 6 27.15 -3; 7 36.15 10; 8 40 0; 9 46 10; 10 51 1; 11 56 10];
% bars = [1 1 3; 2 1 2; 3 2 3; 4 2 4; 5 3 4; 6 3 6; 7 4 6; 8 4 5; 9 5 6; 10 5 7; 11 6 7; 12 6 8; 13 7 8; 14 7 9; 15 8 9; 16 8 10; 17 9 10; 18 9 11; 19 10 11];
% reactions = [1 1 0; 1 0 1; 11 0 1];
% loads = [4 23 0; 5 0 10; 7 50 -10; 9 -50 0];

nodes = [1 0 0; 2 3 0; 3 6 0; 4 9 0; 5 12 0 ; 6 15 0 ; 7 18 0 ; 8 1.5 3; 9 4.5 3; 10 7.5 3; 11 10.5 3; 12 13.5 3; 13 16.5 3];
bars = [1 1 2; 2 2 3; 3 3 4; 4 4 5; 5 5 6; 6 6 7; 7 1 8; 8 8 9; 9 9 10; 10 10 11; 11 11 12; 12 12 13; 13 2 8; 14 2 9; 15 3 9; 16 3 10; 17 4 10; 18 4 11; 19 5 11; 20 5 12; 21 6 12; 22 6 13; 23 13 7];
reactions = [1 1 0; 1 0 1; 7 0 1];
loads = [3 0 -10; 4 0 -10; 5 0 -10];


%QUESTION SET
%6.1.20
% bars = [1 1 2;  2 2 3; 3 3 4;4 4 7;5 7 10;6 10 13;7 13 14;8 12 14;9 9 12;10 6 9;11 1 6;12 2 6;13 2 4;14 4 5;15 5 6;16 5 9; 17 5 7;18 7 8;19 8 9;20 8 12;21 8 10;22 10 11;23 11 12;24 11 14;25 11 13;];
% nodes = [1 0 0;2 0 1;3 0 2;4 2 2;5 2 1;6 2 0;7 4 2;8 4 1;9 4 0;10 6 2;11 6 1;12 6 0;13 8 2;14 8 0;];
% reactions = [1 1 0; 1 0 1;14 0 1];
% loads = [6 0 -2000; 9 0 -2000; 12 0 -2000;];
%  6.1.17
bars = [1 1 2;2 2 3;3 3 4;4 4 5;5 5 6;6 6 7;7 7 8;8 8 9;9 1 9;10 2 9;11 2 8;12 3 8;13 3 7;14 4 7;15 4 6;];
nodes = [1 0 0;2 5 5;3 10 10;4 15 15;5 20 20;6 20 15;7 15 10;8 10 5;9 5 0];
reactions = [1 1 0;1 0 1;5 0 1];
loads = [2 0 -10000];


TrussPlotter(nodes, bars, reactions, loads);
TrussAnalyser(bars,nodes,reactions,loads);
TrussVisualizer(nodes,bars,reactions,loads)