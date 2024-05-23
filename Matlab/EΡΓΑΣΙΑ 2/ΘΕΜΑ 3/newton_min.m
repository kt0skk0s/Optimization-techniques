function [ x_end,k ] = newton_min(  epsilon, startingPoint, f, gradf ,hessianf )
    k = 1;
    x_end(: ,k) = startingPoint;
    grad(:,k) = gradf(x_end(1,k),x_end(2,k));
    e = epsilon; l = (10*e)/4; % I want l>epsilon/2 , so i define l=2.5*epsilon 
    alpha = 0; beta = 6; % the interval, where i look for minimum g. 
    maxStep = 500;
    
    while norm(grad(:,k)) >= e 
        isPositive = isPositiveDefinite(hessianf(x_end(1,k),x_end(2,k)));
        if(isPositive == 0)
            break;
        end
        d(:,k) = (-inv(hessianf(x_end(1,k), x_end(2,k)))) * (gradf(x_end(1,k),x_end(2,k)));
            
        h = @(g) f(x_end(1,k) - g * grad(1,k), x_end(2,k) - g * grad(2,k));
        g = golden_section(h,l,alpha,beta);
        x_end(:,k+1) = x_end(:,k)+(g*d(:,k));
        
        grad(:,k+1) = gradf(x_end(1,k+1),x_end(2,k+1));
        k = k + 1;
        
        if(k > maxStep)
            disp('Max steps limit exceeded... aborting')
            break
        end
    
    end
end
