%% Prelim Assignment Script Question 3
clear
clc
close all;


%% Initialize Variables
k = 128;
n = k^2;
A = gallery('poisson',k);
tol = 1e-8;
x0 = eye(n,1);

maxIt = 5000;

%% Obtain Eigenvalue Estimates
[lambda,myEvec] = powerIteration(A,x0,@(x) fpiInverseMethod(A,x),tol,maxIt);

%% Analyze Convergence Results
[eVecs,eVals] = eigs(A,2,'smallestabs');
rate = eVals(1,1)/eVals(2,2);
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
