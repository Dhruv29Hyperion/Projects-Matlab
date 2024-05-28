function [square_packing]=Packing_fraction(length_of_side,radius)
square_size=length_of_side/2;
hold on
x=[square_size square_size -square_size -square_size square_size];
y=[square_size -square_size -square_size square_size square_size];
xlim([-square_size-2 square_size+2])
ylim([-square_size-2 square_size+2])
grid on
plot(x,y)
x=-square_size+radius;
y=-square_size+radius;
no_of_square_circle=0;
while x<square_size
    while y<square_size
        if (x+radius >square_size)|| (y+radius>square_size)
            y=y+2*radius;
            continue
        else
            fplot(@(t) radius*sin(t)+x, @(t) radius*cos(t)+y);
            no_of_square_circle=no_of_square_circle+1;
            y=y+2*radius;
        end
    end
    y=-square_size+radius;
    x=x+2*radius;
end
b=length_of_side*length_of_side;
a=no_of_square_circle*pi*radius*radius;
square_packing=a/b;