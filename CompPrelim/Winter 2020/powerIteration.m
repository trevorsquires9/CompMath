%%%%%%%%%%%%%%%%%%%%%%%%%%%
% POWERITERATION.m
%
% DESCRIPTION
%   Uses the power method to compute the closest eigenpair to alpha of a matrix A
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - n x n matrix
%   v0 - 1 x n vector of initial guess for eigenvector
%   tol - tolerance for quitting
%
% OUTPUT
%   lambda - eigenvalue approximation vector
%   v - closest eigenvector to alpha's eigenvector
%
% NOTES
%   Fixes the size of the vector if transposed, errors if not right size.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [lambda,x] = powerIteration(A,v0,g,tol,maxIt)
%% Initialization
n = length(v0);

x = zeros(n,maxIt);
lambda = zeros(1,maxIt);

x(:,1) = v0;
lambda(1) = x(:,1)'*A*x(:,1)/(x(:,1)'*x(:,1));

for i = 2:maxIt
    x(:,i) = g(x(:,i-1));
    lambda(i) = x(:,i)'*A*x(:,i)/(x(:,i)'*x(:,i));
    error = norm(A*x(:,i)-lambda(i)* x(:,i));
    if error < tol
        break;
    end
end
x = x(:,1:i);
lambda = lambda(1:i);
    



