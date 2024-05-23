function [f_call,a,b] = bisectionDerivative(a,b,n,f,j)
   
    if j == 1 
        fplot(f,[a(1),b(1)],2);
        hold on
    end

    k=1;
    f_call = 0;
    g = diff(f_call,1);
   
    while k ~= n+1
        x(k) = (a(k) + b(k))/2;
        tempg = subs(g,x(k));
        f_call = f_call + 1;
        if abs(tempg) < 0.001
            break;
        elseif tempg < 0
               a(k+1) = x(k);
               b(k+1) = b(k);
        elseif tempg > 0
               a(k+1) = a(k);
               b(k+1) = x(k);
        end   
        
    
        if j == 1
            plot(x(k),subs(f,x(k)),'or','MarkerSize',10);
            hold on
        end
        
        k=k+1;
    
    end
    hold off;

end