clear;
close all;
clc;

% x = a and y = b
syms a b ;
f(a,b) = a^3 * exp(-(a)^2 - (b)^4);

grad = gradient(f, [a, b]) ;
flag = 1;
flags = 1;

x_ = -2.5:0.05:2.5;
y_ = x_;
z_ = zeros(length(y_),length(x_));

pos_x = 0;
for i = x_
    pos_x = pos_x + 1;
    pos_y = 1;
    for j = y_
       z_(pos_y,pos_x) = f(i,j);
       pos_y = pos_y + 1;
    end
end


startingPoints  = [[0 ; 0],[-1 ; -1],[1 ; 1]];
epsilon = 0.001;                    
gamma = 0.5;                        

if flag == 1 || flags == 0
    for i = 1:3
        startingPoint  = startingPoints(:,i);
        [x,k] = steepest_constant(epsilon,startingPoint,gamma,grad);
        figure(i);
        plot(x(1,:),x(2,:),'-or')
        if k>1
            iteration = num2str(k-1);
        else
            iteration = num2str(1); 
        end
        x_1 = num2str(x(1,k));
        x_2 = num2str(x(2,k));
        gamma = num2str(gamma);
        f_min = num2str(double(f(x(1,k),x(2,k))));
        title(['$constant \enspace \gamma =' gamma '\enspace with \enspace iterations = $' num2str(k) '\enspace at \enspace point (' x_1 ',' x_2 ') \enspace with \enspace value \enspace f(x,y)=' f_min],'Interpreter', 'latex','FontSize',10)
        hold on
        contour(x_, y_, z_)
        colorbar
        hold off
    end 
end

%% steepest descent min f

if flag == 2 || flags == 0
    for i = 1:3
        startingPoint  = startingPoints(:,i);
        [x,k] = steepest_min(epsilon,startingPoint,f,grad);
        figure(i+3);
        plot(x(1,:),x(2,:),'-or')
        if k>1
            iteration = num2str(k-1);
        else
            iteration = num2str(1); 
        end
        x_1 = num2str(x(1,k));
        x_2 = num2str(x(2,k));
        f_min = num2str(double(f(x(1,k),x(2,k))));
        title(['$min \enspace f(x_k+g_k \cdot d_k ) \enspace with \enspace iterations = $' iteration '\enspace at \enspace point (' x_1 ',' x_2 ') \enspace with \enspace value \enspace f(x,y)=' f_min],'Interpreter', 'latex','FontSize',11)
        hold on
        contour(x_, y_, z_)
        colorbar
        hold off
    end
end




%% steepest descent armijo

if flag == 3 || flags == 0
    for i = 1:3
        startingPoint  = startingPoints(:,i);
        [x,k] = steepest_armijo(epsilon,startingPoint,f,grad);
        figure(i+6);
        plot(x(1,:),x(2,:),'-or')
        if k>1
            iteration = num2str(k-1);
        else
            iteration = num2str(1); 
        end
        x_1 = num2str(x(1,k));
        x_2 = num2str(x(2,k));
        f_min = num2str(double(f(x(1,k),x(2,k))));
        title(['$armijo \enspace step \enspace with \enspace iterations = $' iteration '\enspace at \enspace point (' x_1 ',' x_2 ') \enspace with \enspace value \enspace f(x,y)=' f_min],'Interpreter', 'latex','FontSize',11)
        hold on
        contour(x_, y_, z_)
        colorbar
        hold off
    end
end
