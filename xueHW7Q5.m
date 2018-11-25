%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue
%   Homework 7
%
% Question
%   Problem 5b
%
% Function Dependencies
%   newtoncotes_xue.m
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

f = @(x) 1./(5*x.^4 + 4*x.^3 + 3*x.^2 + 2*x + 1);
n=5;
%% First Interval
a = -1;
b = 1;
for i = 1:20
    int_approx = newtoncotes_xue(f,a,b,i);
    fprintf('For n = %d, the integral approximation of f(x) from %d to %d is %0.7f\n',i,a,b,int_approx)
end
fprintf('\n\n')

%% Second Interval
a = -3;
b = -1;
for i = 1:20
    int_approx = newtoncotes_xue(f,a,b,i);
    fprintf('For n = %d, the integral approximation of f(x) from %d to %d is %0.7f\n',i,a,b,int_approx)
end