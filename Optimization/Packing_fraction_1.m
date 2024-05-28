function [hex_packing]=Packing_fraction_1(length_of_side,radius)
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
no_of_hex_circle=0;
while x<square_size
    while y<square_size
        if (x+radius>square_size)|| (y+radius>square_size)
            y=y+4*radius*cos(pi/6);
            continue
        else
            fplot(@(t) radius*sin(t)+x, @(t) radius*cos(t)+y);
            no_of_hex_circle=no_of_hex_circle+1;
            y=y+4*radius*cos(pi/6);
        end

    end
    y=-square_size+radius;
    x=x+2*radius;
end
x=-square_size+2*radius;
y=-square_size+radius+2*radius*cos(pi/6);
while x<square_size
    while y<square_size
        if (x+radius>square_size)|| (y+radius>square_size)
            y=y+4*radius*cos(pi/6);
            continue
        else
            fplot(@(t) radius*sin(t)+x, @(t) radius*cos(t)+y);
            no_of_hex_circle=no_of_hex_circle+1;
            y=y+4*radius*cos(pi/6);
        end

    end
    y=-square_size+radius+2*radius*cos(pi/6);
    x=x+2*radius;
end
b=length_of_side*length_of_side;
a=no_of_hex_circle*pi*radius*radius;
hex_packing=a/b;
hold off