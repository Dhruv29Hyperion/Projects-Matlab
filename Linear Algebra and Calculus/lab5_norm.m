v1 = [1;2;3];

v2 = [-4,5,6];

A = norm(v1,1);
B = norm(v2,1);

C = norm(v1,2);
D = norm(v2,2);

E = norm(v1,3);

F = norm(v1,"inf");
G = norm(v2,"inf");

mA = [53/360 -13/90 23/360; -11/180 1/45 19/180; -7/360 17/90 -37/360];

H = norm(mA,1);
I = norm(mA,2);
J = norm(mA,"inf");

