close all;
clear;
clc;

syms xx yy
f(xx,yy) = xx^3 * exp(-xx^2-yy^4);
gradf = gradient(f, [xx, yy]) ;
hessianf = hessian(f, [xx, yy]) ;

startingPoints  = [[0 ; 0],[-1 ; -1],[1 ; 1]];
epsilon = 0.001;                     
gamma = 0.5;                         
startingPoint = startingPoints(:,3);

figure;
for j = 1:3
    subplot(3,1,j)
    sgtitle('(x,y) convergence for f');
    if j == 1
        [x,k] = LevengergMargurdt_constant(epsilon,startingPoint,gamma,f,gradf,hessianf);
        type = 'const \gamma';
    elseif j == 2
        [x,k] = LevengergMargurdt_min(epsilon,startingPoint,f,gradf,hessianf);
        type = 'minimize \gamma';
    else
        [x,k] = LevengergMargurdt_armijo(epsilon, startingPoint, f, gradf, hessianf);
        type = 'Armijo \gamma';
    end
    for i=0:1:k-1
        plot(i,x(1,i+1),'*r')
        hold on
        plot(i,x(2,i+1),'ob')
    end
    xlim([0 15])
    xlabel(['numbers of iterations for ',type]) 
    ylabel('[x_k,y_k]')
    legend('x_k','y_k') 
    hold off;
end

