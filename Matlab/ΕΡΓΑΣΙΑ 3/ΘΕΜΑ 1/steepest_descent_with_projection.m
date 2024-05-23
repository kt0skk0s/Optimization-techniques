function [k,point_x,point_y] = steepest_descent_with_projection(e,g,s,x,y,gradf)

    k = 1; 
    point_x = []; point_y = [];
    point_x(k) = x; point_y(k) = y;
    
    maxStep = 8000; 
    
    while (norm(gradf(point_x(k),point_y(k))) >= e )
    %Checking, if my point is feasible. If my point, doesn't lies in X
    %i project it into X, so i can use the method, with a feasible point.
        if restrictions(point_x(k),point_y(k)) == false
            [point_x(k),point_y(k)] = projection_X(point_x(k),point_y(k));
        end
        grad = gradf(point_x(k),point_y(k));
        
        xbar = point_x(k) - s * grad(1,1); %%First, we calculate the 
        ybar = point_y(k) - s * grad(2,1); %%x_k - s_k *gradf(x_k)
         
        [xbar,ybar] = projection_X(xbar,ybar); %%project to find xbar_k
        
        point_x(k+1) = point_x(k) + g * (xbar - point_x(k));
        point_y(k+1) = point_y(k) + g * (ybar - point_y(k));
    
        if(k > maxStep)
            disp('Max steps limit exceeded... aborting')
            break
        end
    
        k = k + 1;
    end
end