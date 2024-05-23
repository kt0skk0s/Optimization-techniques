function x = isPositiveDefinite(A)

    [m,n] = size(A); 
    if m~=n
        error('A is not Symmetric');
    end
   
    x = 1; 
    for i = 1:m
        subA=A(1:i,1:i);
        if(det(subA) <= 0) 
            x = 0;
            break;
        end
    end
    
    % if x
    %     disp('Given Matrix is Positive definite');
    % else
    %     disp('Given Matrix is NOT positive definite');
    % end      
end