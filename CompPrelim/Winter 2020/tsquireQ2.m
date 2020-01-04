%% Prelim Assignment Script Question 2
clear
clc
close all;


%% Initialize Variables
k = 40;
n = k^2;
A = gallery('poisson',k);
tol = 1e-4;
x0 = eye(n,1);
maxIt = 5000;
m = 1:5;

figure();
for i = 1:length(m)
    %% Obtain Eigenvalue Estimates
    [iterates,w,gain] = anderson(A,x0,@(x) fpiPowerMethod(A,x),tol,m(i),maxIt);
    [~,itCount] = size(iterates);
    
    %% Plot each experiment
    subplot(2,length(m),m(i))
    plot(1:itCount,gain);
    plotTitle = sprintf('Gain Plot for m = %d',m(i));
    title(plotTitle)
    xlabel('Iteration')
    ylabel('Gain')
    
    subplot(2,length(m),m(i)+length(m))
    plot(1:itCount,vecnorm(w));plotTitle = sprintf('Norms of w for m = %d',m(i));
    title(plotTitle)
    xlabel('Iteration')
    ylabel('W Norm')
end
