%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue 
%   Homework 2   
%
% Question
%   3.17b
%
% Function Dependencies
%   rootFinder.m
%   
% Notes
%   Uses secant to find roots after bracketing by probes
%
% Author
%   Trevor Squires
%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all;

f = @(x) (x.*cos(x)-sin(x))./x.^2;
tol = 1e-8;
a = -10;
b= 10;
pts = 20;

roots = rootFinder(f,a,b,pts,tol);

for i = 1:length(roots)
    fprintf('Root %d found at %0.10f\n',i,roots(i))
end