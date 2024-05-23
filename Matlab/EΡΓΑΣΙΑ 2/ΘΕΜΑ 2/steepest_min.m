function [x_end,k] = steepest_min( epsilon,startingPoint,f,gradf )

    k=1;
    maxStep = 500;

    x_end(:,k) = startingPoint;
    grad(:,k) = gradf(x_end(1,1),x_end(2,1));

    e = epsilon;
    l = (10*e)/4; 
    alpha = 0; beta = 5; 

    while norm(grad(:,k)) >= e 
        h = @(g) f(x_end(1,k) - g * grad(1,k), x_end(2,k) - g * grad(2,k));
        g = golden_section(h,l,alpha,beta);
        x_end(:,k+1)=x_end(:,k)-(g*grad(:,k));
        grad(:,k+1)=gradf(x_end(1,k+1),x_end(2,k+1));
        k = k + 1;

        if(k > maxStep)
            disp('Max steps limit exceeded... aborting')
            break
        end

    end

    if k >1
    k = k-1;
     
    end
end
