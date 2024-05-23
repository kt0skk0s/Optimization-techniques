clear;
clc;
close all;

n = 50;  
a = zeros(n,1);
b = zeros(n,1);
a(1)= 0;
b(1)= 3;

f1 = @(x) (x-1)^3 + ((x-4)^2)*cos(x);
f2 = @(x) exp(-2*x) + (x-2)^2;
f3 = @(x) (x^2)*log(0.5*x) + sin(0.2*x)^2;


l = 0.01;    
e = [0.005,0.00499999,0.004999,0.004,0.002,0.0005,0.000005];
f_calls = zeros(3,length(e));

for i=1:3
    if i == 1
        f = f1;
    elseif i == 2 
        f = f2;
    elseif i == 3
        f = f3;
    end

    figure(i);
    for j=1:length(e)
        [f_call]= bisection(a,b,n,f,l,e(j),j);
        f_calls(i,j) = f_call;
    end

end
figure(4);
for i=1:2
    subplot(2,2,i);
    plot(e,f_calls(i,:))
    title("For Function f"+ i + " and e variable");
    ylabel("Number of Calls f"+i);
    xlabel('Distance from bisector');
end
subplot(2,2,[3,4]);
plot(e,f_calls(3,:))
title("For Function f3 and e variable");
ylabel('Number of Calls f3');
xlabel('Distance from bisector');
    


fprintf('\n');
disp(' Distance from    How many times a function is ');
disp('    bisector                 called            ');
disp('--------------------------------------------------');
disp('       e            f1         f2         f3');
disp('--------------------------------------------------');

for i=1:length(e)
   fprintf('   %0.8f       %d         %d         %d\n', e(i),f_calls(1,i),f_calls(2,i),f_calls(3,i));
   disp('--------------------------------------------------');
end

 disp('Zero mean, if the number of iterations are less than the max(index) -> To be Carculated need n>>100');
