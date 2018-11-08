%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue 
%   Homework 1   
%
% Question
%   2.10
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

f1 = @(x,delta) cos(x+delta) - cos(x);
f2 = @(x,delta) -2*sin((2*x+delta)/2)*sin(delta/2);
g1 = @(x,delta) f1(x,delta)/delta + sin(x);
g2 = @(x,delta) f2(x,delta)/delta + sin(x);

x0 = 3;
delta =1e-11;

g1Val = g1(x0,delta);
g2Val = g2(x0,delta);

fprintf('g1 = %e\ng2 = %e\n',g1Val,g2Val)

