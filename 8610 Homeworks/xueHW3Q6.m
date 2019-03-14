%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spring 2018 Math 8610 w/ Xue 
%   Homework 3   
%
% Problem
%   6
%
% Function Dependencies
%   HW3_GKLsvds.m
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

eigenBlarge = eigs([zeros(32) B';B zeros(32)],5,'largestabs');
eigenBsmall = eigs([zeros(32) B';B zeros(32)],5,'smallestabs');

eigenAlarge = sqrt(abs(eigs(A'*A,5,'largestabs')));
eigenAsmall = sqrt(abs(eigs(A'*A,5,'smallestabs')));




