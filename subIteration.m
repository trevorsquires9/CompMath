%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SUBITERATION.m
%
% DESCRIPTION
%   Uses subspace iteration to compute the largest p eigenpairs of a matrix A
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - n x n matrix
%   x0 - n x p matrix of initial guesses for eigenvector
%   p - how many dominant eigenvalues to search for
%   tol - tolerance for quitting
%
% OUTPUT
%   lambda - vector of p dominant eigenvalues
%   v - matrix of p dominant eigenvectors
%
% NOTES
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [eVec,eVal,error] = subIteration(A,x0,p,tol)

assert(norm(ctranspose(x0)*(x0)-eye(p))<1e-7)
X = x0;
error = tol+1;
step = 1;
eLength = 1;


while error(step) > tol
    Y = A*X;
    M = ctranspose(X)*Y;
    R = Y - X*M;
    err = norm(R)/norm(Y);
    [X,~] = qrgs(Y);
    
    if step+1>eLength
        error(2*step) = 0;
        eLength = eLength*2;
    end
    
    step=step+1;
    error(step) = err;
end

error = error(1:nnz(error));
[eVec,eVal] = eigs(M,p,'largestabs');
eVal = diag(eVal);
eVec = X*eVec;

