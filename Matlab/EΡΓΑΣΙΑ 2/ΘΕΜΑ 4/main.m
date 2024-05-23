%% KYRIACOS TSOKKOS   AEM : 10496

clear; 
close all; 
clc;

syms xx yy
f(xx,yy) = xx^3 * exp(-xx^2-yy^4);

gradf = gradient(f, [xx, yy]);
hessianf = hessian(f, [xx, yy]);

flag = 1;
flags = 1;

x_ = -2.5:0.05:2.5;
y_ = x_;

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

     for i = 1:3
        startingPoint  = startingPoints(:,i);
        [x,k] = LevengergMargurdt_constant(epsilon,startingPoint,gamma,f,gradf,hessianf);
        figure;
        plot(x(1,:),x(2,:),'-or')
        iteration = num2str(k);
        x_1 = num2str(x(1,k));
        x_2 = num2str(x(2,k));
        f_min = num2str(double(f(x(1,k),x(2,k))));
        title(['$constant \enspace \gamma = 0.5 \enspace with \enspace iterations = $' iteration '\enspace at \enspace point (' x_1 ',' x_2 ') \enspace with \enspace value \enspace f(x,y)=' f_min],'Interpreter', 'latex','FontSize',10)
        hold on;
        contour(x_, y_, z_);
        colorbar;
        hold off;
     end




    for i = 1:3
        startingPoint  = startingPoints(:,i);
        [x,k] = LevengergMargurdt_min(epsilon,startingPoint,f,gradf,hessianf);
        figure;
        plot(x(1,:),x(2,:),'-or')

        iteration = num2str(k); 

        x_1 = num2str(x(1,k));
        x_2 = num2str(x(2,k));
        f_min = num2str(double(f(x(1,k),x(2,k))));
        title(['$min \enspace f(x_k+g_k \cdot d_k ) \enspace with \enspace iterations = $' iteration '\enspace at \enspace point (' x_1 ',' x_2 ') \enspace with \enspace value \enspace f(x,y)=' f_min],'Interpreter', 'latex','FontSize',10)
        hold on
        contour(x_, y_, z_)
        colorbar
        hold off;
    end




    for i = 1:3
        startingPoint  = startingPoints(:,i);
        [x,k] = LevengergMargurdt_armijo(epsilon,startingPoint,f,gradf,hessianf);
        figure;
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
    end
