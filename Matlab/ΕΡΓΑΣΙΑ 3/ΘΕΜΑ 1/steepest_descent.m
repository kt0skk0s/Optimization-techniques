function [k,g,point_x,point_y] = steepest_descent(e,g,x,y,gradf,f)
    
    k = 1;

    maxStep = 1000;

    point_x = []; 
    point_y = [];

    point_x(k) = x;
    point_y(k) = y;
    
    while ( norm(gradf(point_x(k),point_y(k))) >= e )
        d = - gradf(point_x(k), point_y(k));
        if criteria_testing(g,d,k,point_x,point_y,gradf,f)
            point_x(k+1) = point_x(k) + g * d(1,1);
            point_y(k+1) = point_y(k) + g * d(2,1);
        else
            fprintf('Error! At %d iteration, the recuirements of the criteria was not fulfilled',k)
            k = 0; 
            break;
        end
        if(k > maxStep)
            disp('Max steps limit exceeded... aborting')
            break
        end
        k = k + 1;
    end
end