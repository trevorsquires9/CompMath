%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue 
%   Homework 5   
%
% Problem
%   3
%
% Function Dependencies
%   qrgs.m
%   subIteration.m
%   subShiftIteration.m
%
% Notes
%
% Author
%   Trevor Squires
%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all;

load aerofoil.mat

n = length(A);
p = 11;
tol = 1e-10;


x0 = rand(n,p);
[x0,~] = qrgs(x0);

%% Subspace Iteration
[~,subEVal,error] = subIteration(A,x0,p,tol);
trueEVal = eigs(A,p,'largestabs');

semilogy(error)
title('Subspace Iteration')
xlabel('Iteration')
ylabel('Error')

%% Shift Invert Subspace Iteration
alpha = -0.1;
p = 9;
[x0,~] = qrgs(rand(n,p));
[~,shiftEVal,error] = shiftSubIteration(A,x0,p,alpha,tol);

figure();
semilogy(error)
title('Shift Invert Subspace Iteration')
xlabel('Iteration')
ylabel('Error')