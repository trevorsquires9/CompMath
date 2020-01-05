%%%%%%%%%%%%%%%%%%%%%%%%%%%
% scriptQ1.m
%
% DESCRIPTION
%   Script for computing results for question 1
%
% AUTHOR
%   88759
%
% FUNCTION DEPENDENCIES
%   - powerIteration.m
%   - fpiPowerMethod.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all;


%% Initialize Variables
k = 40;
n = k^2;
A = gallery('poisson',k);
tol = 1e-4;
x0 = eye(n,1);
maxIt = 5000;

%% Obtain Eigenvalue Estimates
[lambda,myEvec] = powerIteration(A,x0,@(x) fpiPowerMethod(A,x),tol,maxIt);

%% Analyze Convergence Results
[eVecs,eVals] = eigs(A,2);
rate = eVals(2,2)/eVals(1,1);
trueEvec = eVecs(:,1);

iterations = length(lambda);
error = zeros(iterations,1);
for i = 1:iterations
    error(i) = norm(lambda(i)-eVals(1,1));
end

observedRates = zeros(iterations-1,1);
for i = 1:iterations-1
    observedRates(i) = error(i+1)/error(i);
end

figure();
semilogy(abs(eVals(1,1)-lambda))
title('Eigenvalue errors')
xlabel('Iteration')
ylabel('Absolute error')