function [ x_end,k ] = newton_armijo(  epsilon, startingPoint, f, gradf ,hessianf )
    k = 1;
    x_end(: ,k) = startingPoint;
    grad(:,k) = gradf(x_end(1,k),x_end(2,k));
    e = epsilon;
    maxStep = 500;
    
    while norm(grad(:,k)) >= e
        
        isPositive = isPositiveDefinite(hessianf(x_end(1,k),x_end(2,k)));
        if(isPositive == 0)
            break;
        end

        d(:,k) = (-inv(hessianf(x_end(1,k), x_end(2,k)))) * (gradf(x_end(1,k),x_end(2,k)));
       
        gamma = armijo_gamma(x_end,k,f,gradf);
        
        x_end(:,k+1) = x_end(:,k)+(gamma*d(:,k));
        
        grad(:,k+1) = gradf(x_end(1,k+1),x_end(2,k+1));
        k = k + 1;
        
        if(k > maxStep)
            disp('Max steps limit exceeded... aborting')
            break
        end
        
    
    end
end
