%%%%%%%%%%%%%%%%%%%%%%%%%%%
% POWERITERATION.m
%
% DESCRIPTION
%   Uses the power/inverse method to compute eigenvalues of a matrix A
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - n x n matrix
%   v0 - n x 1 vector of initial guess for eigenvector
%   g - function used to generate the next point.  For power method, try
%       g(x) = A*x/||A*x||, and for inverse method, try g(x) = (A\x)/(||A\x||)
%   tol - tolerance for quitting
%   maxIt - maximum number of iterations before quitting

%
% OUTPUT
%   lambda - eigenvalue approximation vector
%   v - matrix of eigenvector approximations
%
% NOTES
%   - Saves on computing Ax by storing the matrix-vector product after the
%   first computation
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
    x(:,i) = g(x(:,i-1)); %use function handle to compute new point
    tmp = A*x(:,i); %save matrix-vector operations
    lambda(i) = x(:,i)'*tmp/(x(:,i)'*x(:,i));
    error = norm(tmp-lambda(i)* x(:,i)); 
    if error < tol %determine exit condition
        break;
    end
end

%% Postprocessing 
x = x(:,1:i);
lambda = lambda(1:i);
    



