function [x_result, k,gamma] = steepest_constant( epsilon, startingPoint, gamma, grad )

    maxStep = 500;
    k=1;

    x_result(: ,k) = startingPoint;
    
    dif_f(:,k) = grad(x_result(1,k),x_result(2,k));

    e = epsilon;
    
    while norm(dif_f(:,k)) >= e
        x_result(:,k+1) = x_result(:,k)-(gamma*dif_f(:,k));
        dif_f(:,k+1) = grad(x_result(1,k+1),x_result(2,k+1));
        k = k + 1;
        if(k > maxStep)
            disp('Max steps limit exceeded... aborting')
            break
        end
    end
end
