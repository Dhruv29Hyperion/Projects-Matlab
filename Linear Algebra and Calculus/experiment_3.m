%x = -3:0.01:5;
%y = (x+5).^2;

%plot(x,y,"r");
%fplot(@(x)(5*sin(x))/(x + exp(-0.75.*x)) - (3/5).*x,[-5 10]);
fplot(@(x)sqrt(abs(cos(3.*x))) + (sin(4*x)).^2,[-2*pi 2*pi])

%x = (-pi:0.01:pi);
%y1 = sin(x);
%y2 = cos(x);

%plot(x,y1,"--g",x,y2,"r")

%xlabel("X-Axis");
%ylabel("Y-Axis");

%legend("The graph of function of x")

%v1 = [1 3 -5];
%v2 = [2 3 1];
%v3 = [5 9 -3];

%quiver3(0,0,0,v1(1),v1(2),v1(3));
%hold on
%quiver3(0,0,0,v2(1),v2(2),v2(3));
%quiver3(0,0,0,v3(1),v3(2),v3(3));
% hold off
% geometrically independent vectors



