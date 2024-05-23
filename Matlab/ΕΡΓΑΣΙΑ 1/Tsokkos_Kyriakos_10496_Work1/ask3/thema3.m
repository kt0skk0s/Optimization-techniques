clear;
clc;
close all;

% Initializing [a,b] Initial Interval and Functions {fi(x)}->i=1,2,3 that will be Minimized
l = [0.0005,0.005,0.05,0.15];      % Final Search Scope     l>0
a1 = 0;
b1 = 3;

f1 = @(x) (x-1)^3 + ((x-4)^2)*cos(x);

f2 = @(x) exp(-2*x) + (x-2)^2;

f3 = @(x) (x^2)*log(0.5*x) + sin(0.2*x)^2;


f_calls = zeros(3,length(l)); % How many times a function is called

for i=1:3
    if i == 1
        f = f1;
    elseif i == 2 
        f = f2;
    elseif i == 3
        f = f3;
    end

    figure(i);
    for j=1:length(l)
        n = 0;
        while 1
            if fibonacci(n) > ((b1-a1)/l(j)) % If n=30 -> F(n) 832040 >> (3-(-1))/0.002 = 2000
                break;
            else
              n = n+1;
            end
        end

        a = zeros(n,1); a(1) = a1;
        b = zeros(n,1); b(1) = b1;

        [f_call,a,b]= Fibonacci(a,b,f,n,j);
        f_calls(i,j) = f_call;
        % Graphs of (k,a(k)) and (k,b(k) for every Tolarance
        k = 1:n;
        figure(i+3);
        subplot(length(l),1,j);
        plot(k,a,'rx');
        hold on;
        plot(k,b,'bo');
        title(['For Tolarance ',num2str(l(j))])
        hold off
    end
    legend({'a','b'},'Location','southwest')
end

figure(7);

for i=1:2
    subplot(2,2,i);
    plot(l,f_calls(i,:))
    title("f"+ i + " and l");
    ylabel("Number of Calls f"+i);
    xlabel('Tolarance');
end
subplot(2,2,[3,4]);
plot(l,f_calls(3,:))
title("f3 and l");
ylabel('Number of Calls f3');
xlabel('Tolarance');


fprintf('\n');
disp('   Tolarance   How many times a function is called');
disp('--------------------------------------------------');
disp('       l            f1         f2         f3');
disp('--------------------------------------------------');

for i=1:length(l)
   fprintf('   %0.8f       %d         %d         %d\n', l(i),f_calls(1,i),f_calls(2,i),f_calls(3,i));
end