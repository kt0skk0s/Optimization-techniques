function [x_end,k] = steepest_armijo( epsilon,startingPoint,f,gradf )

    k=1;
    maxStep = 500;

    x_end(:,k)=startingPoint;
    grad(:,k)=gradf(x_end(1,1),x_end(2,1));

    e = epsilon;

    while norm(grad(:,k)) >= e 
        
        gamma=armijo_gamma(x_end,k,f,gradf);  
        x_end(:,k+1)=x_end(:,k)-(gamma*grad(:,k));
        grad(:,k+1)=gradf(x_end(1,k+1),x_end(2,k+1));
        k = k + 1;

        if(k > maxStep)
            disp('Max steps limit exceeded... aborting')
            break
        end

    end

    if k > 1
    k = k-1;
     
    end
end
