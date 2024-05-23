function [ gamma ] = armijo_gamma( x, k, f, grad)

v1=x(:,k);

beta=0.5;
rho=0.2;  
m=1;
mmax=20;

while( m < mmax ) 
    
    gk = double(grad(double(v1(1,1)),double(v1(2,1))));
    
    dk = double(-gk);
     
    v2 = double(v1+(beta^m)*dk) ;
   
    if  double(f(double(v2(1,1)),double(v2(2,1))))  <=    double(f(double(v1(1,1)),double(v1(2,1)))+rho*(beta^m)*gk*dk')
       
        gamma=beta^m;
        return;  
       
    end
    
    v1=double(v2);
    m=m+1;
 
end

gamma=beta^m; 
 
end