
 function [f_call,a,b] = Fibonacci(a,b,f,n,j)
    % First plot the function
    if j == 1 
        fplot(f,[a(1),b(1)],2);
        hold on
    end
    % To display results
    %display-disp('Iterations         x1                   x2            fx     ');
    %display-disp('-------------------------------------------------------------');
    
    % Start Iterations
    k=1;
    f_call = 0;
    x1 = zeros(n,1);
    x2 = zeros(n,1);
      
    fnc = 1:n;
    Fc = fibonacci(fnc);        % Sequence of Fibonacci(Fn+1= Fn + Fn-1) 
    
    x1(1) = a(1)+(Fc(n-2)/Fc(n))*(b(1)-a(1));
    x2(1) = a(1)+(Fc(n-1)/Fc(n))*(b(1)-a(1));
    
    % If b-a smaller than tolarance break the while loop
    while k <= n-2
        
        if f(x1(k)) < f(x2(k))
               a(k+1) = a(k);
               b(k+1) = x2(k);

               x1(k+1) = a(k+1)+(Fc(n-k-1)/Fc(n-k)).*(b(k+1)-a(k+1));
               x2(k+1) = x1(k);
               x = x2;
        else
               a(k+1) = x1(k);
               b(k+1) = b(k);
               x1(k+1) = x2(k);
               x2(k+1) = a(k+1)+(Fc(n-k-1)/Fc(n-k)).*(b(k+1)-a(k+1));
               x = x1;
        end   
    
        
    % Plot points
        if j == 1
            plot(x(k),f(x(k)),'or','MarkerSize',10);
            hold on
        end
        
        % This will display the iterations on screen
        %display-fprintf('%4d  %20e %20e %14e\n', k-1,x1(k),x2(k),f(x(k)))
        k=k+1;
        f_call = f_call + 2;
    
        
    
        if k >= n % If the number of iterations are less than the max(index) break the loop
            f_call = 0;
            break;
        end
    
    end
    
    x1(n) = x1(n-1);
    x2(n) = x2(n-1);
    if f(x1(n)) > f(x2(n))
        a(n) = x1(n);
        b(n) = b(n-1);
    else
        a(n) = a(n-1);
        b(n) = x2(n);
    end
    
    hold off;
end