

function [f_call,a,b,k]=bisection(a,b,n,f,l,e,j)
    
    if j == 1 
        fplot(f,[a(1),b(1)],2);
        hold on
    end
    
   
    k=1;
    f_call = 0;
    
    x1 = zeros(n,1);
    x2 = zeros(n,1);
   
    while (b(k)-a(k)) > l
    
        x1(k) = (a(k)+b(k))./2-e;
        x2(k) = (a(k)+b(k))./2+e;
    
        if f(x1(k)) < f(x2(k))
               a(k+1) = a(k);
               b(k+1) = x2(k);
               x = x2;
        else
               a(k+1) = x1(k);
               b(k+1) = b(k);
               x = x1;
        end   
    
        
        % Plot points
        if j == 1
            plot(x(k),f(x(k)),'or','MarkerSize',10);
            hold on
        end
        
        % This will display the iterations on screen
        %'display'fprintf('%4d  %20e %20e %14e\n', k-1,x1(k),x2(k),f(x(k)))
        k = k + 1;
        f_call = f_call + 2;

        if k > n
           f_call = 0;
           break;
        end
    end
    hold off;
    a = a(1:k,1);
    b = b(1:k,1);
end