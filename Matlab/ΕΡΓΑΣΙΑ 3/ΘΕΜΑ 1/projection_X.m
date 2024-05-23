function [xbar,ybar] = projection_X(x,y)

if x <= -10 
    xbar = -10;
elseif x < 5
    xbar = x;
else
    xbar = 5;
end

if y <= -8
    ybar = -8;
elseif y < 12
    ybar = y;
else
    ybar = 12;
end