function [ x_end,k ] = newton_constant(  e, startingPoint, g, gradf ,hessianf )
    k = 1;
    x_end(: ,k) = startingPoint;
    grad(:,k) = gradf(x_end(1,k),x_end(2,k));
    epsilon = e;
    gamma = g;
    maxStep = 500;
    
    while norm(grad(:,k)) >= epsilon 
        isPositive = isPositiveDefinite(hessianf(x_end(1,k),x_end(2,k)));
        if(isPositive == 0)
            break;
        end
        d(:,k) = (-inv(hessianf(x_end(1,k), x_end(2,k)))) * (gradf(x_end(1,k),x_end(2,k)));
        x_end(:,k+1) = x_end(:,k) + (gamma * d(:,k));
        grad(:,k+1) = gradf(x_end(1,k+1), x_end(2,k+1));
        k = k + 1;
        
        if(k > maxStep)
            disp('Max steps limit exceeded... aborting')
            break
        end
        
    end
end