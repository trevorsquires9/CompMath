%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TSQUIREQ6.m
%
% DESCRIPTION
%   Script for computing results for question 6
%
% AUTHOR
%   Trevor Squires
%
% FUNCTION DEPENDENCIES
%   - anderson.m
%   - andersonQ6.m
%   - fpiPCGMethod.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
c = 10.^(-1:-1:-3);

figure();
for i = 1:length(m)
    %% Obtain Eigenvalue Estimates
    [iterates,w,gain] = anderson(A,x0,@(x) fpiPCGMethod(A,x),tol,m(i),maxIt);
    [~,itCount] = size(iterates);
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

%% Now with a less general tolerance
for j = 1:length(c)
    figure();
    for i = 1:length(m)
        %% Obtain Eigenvalue Estimates
        [iterates,w,gain] = andersonQ6(A,x0,@(x,y,z) fpiPCGMethod(A,x,y,z,c(j)),tol,m(i),maxIt);
        [~,itCount] = size(iterates);
        subplot(2,length(m),m(i))
        plot(1:itCount,gain);
        plotTitle = sprintf('c = %0.3f, Gain Plot for m = %d',c(j),m(i));
        title(plotTitle)
        xlabel('Iteration')
        ylabel('Gain')
        
        subplot(2,length(m),m(i)+length(m))
        plot(1:itCount,vecnorm(w));
        plotTitle = sprintf('c = %0.3f, Norms of w for m = %d',c(j),m(i));
        title(plotTitle)
        xlabel('Iteration')
        ylabel('W Norm')
    end
end