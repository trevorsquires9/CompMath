%% Prelim Assignment Script Question 5
clear
clc
close all;


%% Initialize Variables
k = 128;
n = k^2;
A = gallery('poisson',k);
tol = 1e-8;
x0 = eye(n,1);
maxIt = 5000;
m = 1:2;

figure();
for i = 1:length(m)
    %% Obtain Eigenvalue Estimates
    [iterates,w,gain] = anderson(A,x0,@(x) fpiInverseMethod(A,x),tol,m(i),maxIt);
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

