function [f_call,a,b] = golden_sector(a,b,n,f,l,j)

    if j == 1
        fplot(f,[a(1),b(1)],2);
        hold on
    end
    
    k=1;
    f_call = 0;
    g=double((sqrt(5)-1)/2);    
    
    x1 = zeros(n,1);
    x2 = zeros(n,1);
  
    while (b(k)-a(k)) > l
    
        x1(k) = a(k)+(1-g).*(b(k)-a(k));
        x2(k) = a(k)+g.*(b(k)-a(k));
    
        if f(x1(k)) <= f(x2(k))
               a(k+1) = a(k);
               b(k+1) = x2(k);
               x1(k+1) = a(k+1)+(1-g).*(b(k+1)-a(k+1));
               x2(k+1) = x1(k);
               x = x2;
        else
               a(k+1) = x1(k);
               b(k+1) = b(k);
               x1(k+1) = x2(k);
               x2(k+1) = a(k+1)+g.*(b(k+1)-a(k+1));
               x = x1;
        end   
    
        
        if j == 1
            plot(x(k),f(x(k)),'or','MarkerSize',10);
            hold on
        end

        k=k+1;
        f_call = f_call + 2;
    
    end
    hold off;
end