%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue
%   Homework 8
%
% Question
%   Problem 16.2
%
% Function Dependencies
%   None
%
% Notes
%   None
%
% Author
%   Trevor Squires
%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all;

%% Initialization
f = @(y) -y.^2;
h = [0.2 0.1 0.05 0.02 0.01 0.005 0.002];
y0 = 1;
int = [1 2];


%% Part B
global_err = zeros(1,length(h));
for k = 1:length(h)
    t = 1:h(k):2;
    y = zeros(1,length(t));
    y(1) = y0;
    for i = 2:length(t)
        y(i) = y(i-1) + h(k)*f(y(i-1)+h(k)/2 * f(y(i-1)));
    end
    
    trueY = 1./t;
    err = abs(y-trueY);
    global_err(k) = err(end);
    fprintf('h = %e:\tGlobal Error at x = %d is %e\t',h(k),int(2),global_err(k))
    if k ~= 1
        fprintf('Rate = %0.3f',log(global_err(k-1)/global_err(k))/log(h(k-1)/h(k)));
    end
    fprintf('\n')
end

%% Part C
