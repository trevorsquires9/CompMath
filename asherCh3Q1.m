%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue 
%   Homework 2   
%
% Question
%   3.1
%
% Function Dependencies
%   bisection.m
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

f = @(x) sqrt(x) - 1.1;
tol = 1e-8;
a = 0;
b = 2;

iterates = bisection(f,a,b,tol);
n = length(iterates);
solu = iterates(n);


