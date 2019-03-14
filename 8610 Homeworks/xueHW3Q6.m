%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spring 2018 Math 8610 w/ Xue 
%   Homework 3   
%
% Problem
%   6
%
% Function Dependencies
%   GKNaive.m
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


%% Part A
rng('default');
F = randn(10,10);
B = GKnaive(F);

err = norm(svd(F)-svd(B));

%% Part B
col = linspace(-1,1,1024*1024+1)';
A = col.^(0:31);

[Q,R] = qr(A,0);
B = GKnaive(R);

eigenB = abs(eig([zeros(32) B';B zeros(32)]));
largestB = eigenB(end-4:end);
smallestB = eigenB(1:5);

eigenA = sqrt(abs(eig(A'*A)));
largestA = eigenA(end-4:end);
smallestA = eigenA(1:5);



