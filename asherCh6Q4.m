%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue
%   Homework 4
%
% Question
%   Problem 6.4
%
% Function Dependencies
%   normalEq.m
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

A = [1 0; 1 1; 1 2; 1 3];
b = [0.1 0.9 2 pi]';

x = normalEq(A,b);

fprintf('gamma_1 = %e\ngamma_2 = %e\n',exp(x(1)),x(2))


