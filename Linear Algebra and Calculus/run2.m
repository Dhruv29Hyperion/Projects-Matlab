x = -2*pi:0.5:2*pi;
y = cos(x);
t = sin(x);
plot(x,y,x,t,"--g");
xlabel("x-axis");
ylabel("y-axis");
legend("Graphs of cos(x)","graph of sin(x)");

%fplot(@(x)(sin(x)).^2,[-2*pi 2*pi]);

v1 = [1 2 3];
v2 = [2 3 6];
%quiver3(0,0,0,v(1),v(2),v(3));

p1 = @(x,y) x*v1(1) + y*v2(1);
p2 = @(x,y) x*v1(2) + y*v2(2);
p3 = @(x,y) x*v1(3) + y*v2(3);

[X,Y] = meshgrid(-5:1:5);
px = p1(X,Y);
py = p2(X,Y);
pz = p3(X,Y);

surf(px,py,pz)