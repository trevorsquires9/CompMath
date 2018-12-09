%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue
%   Homework 8
%
% Question
%   Problem 16.8
%
% Function Dependencies
%   RKSAutoExplicit.m
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
a = [0 0 0 0; 0.5 0 0 0; 0 0.5 0 0; 0 0 1 0]; %a = [0 0  0; 0.5 0 0; 0 1 0];
b = [1/6 1/3 1/3 1/6];%b = [1/6 2/3 1/6];
f = @(y) -y.^2;
h = [0.2 0.1 0.05 0.02 0.01 0.005 0.002];
t = 10;
int = [1 1+h*t];
y0 = 1;


%% Evaluation
global_err = zeros(1,length(h));
for i = 1:length(h)
    [x,y] = RKSAutoExplicit(f,y0,h(i),int,a,b);
    trueY = 1./x;
    
    err = abs(y-trueY);
    global_err(i) = err(end);
    fprintf('h = %e\t Error = %e\t',h(i),global_err(i))
    if i ~= 1
        fprintf('Rate = %0.3f',log(global_err(i-1)/global_err(i))/log(h(i-1)/h(i)));
    end
    fprintf('\n')
    
    
    
end