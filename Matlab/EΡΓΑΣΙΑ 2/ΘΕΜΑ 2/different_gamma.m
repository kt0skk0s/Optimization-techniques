epsilon = 0.001;
startingPoint = [0,0];

syms xx yy
f(xx,yy) = xx^3 * exp(-xx^2-yy^4);

grad = gradient(f, [xx, yy]) ;
size = 10;
n = zeros(size,1); g = zeros(size,1);

i = 0;
for gamma = linspace(0.2,2,size)
    
    i = i + 1;
    [~,n(i),g(i)] = steepest_constant(epsilon,startingPoint,gamma,grad);
    
end

plot(g,n,'*r','LineWidth',1.4)
title('$f$','Interpreter', 'latex')
xlabel('\gamma') 
ylabel('numbers of iterations')