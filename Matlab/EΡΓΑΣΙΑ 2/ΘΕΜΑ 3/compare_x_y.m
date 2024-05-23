clear;
clc;
clear all ;

syms xx yy

f(xx,yy) = xx^3 * exp(-xx^2-yy^4);
gradf = gradient(f, [xx, yy]) ;
hessianf = hessian(f, [xx, yy]) ;

startingPoints  = [[0 ; 0],[-1 ; -1],[1 ; 1],[-1 ; -0.5]];
epsilon = 0.001;                    
gamma = 0.5;                       

startingPoint = startingPoints(:,4);

figure;
for j = 1:3
    subplot(3,1,j)
    sgtitle('(x,y) convergence for f');
    if j == 1
        [x,k] = newton_constant(epsilon,startingPoint,gamma,gradf,hessianf);
        type = 'const \gamma';
    elseif j == 2
        [x,k] = newton_min(epsilon,startingPoint,f,gradf,hessianf);
        type = 'minimize \gamma';
    else
        [x,k] = newton_armijo(epsilon,startingPoint,f,gradf,hessianf);
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
