%%%%%%%%%%%%%%%%%%%%%%%%%%%
% POWERMETHOD.m
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



function [lambda,v] = powerMethod(A,v0,tol)

[m,n] = size(v0);
if n ~= 1
    v0 = v0';
    tmp = m;
    m = n;
    n = tmp;
end

assert(m == length(A))
assert(n == 1)

error = tol+1;
v0 = v0/norm(v0);
v = v0;
step = 1;
eLength = 1;
lambda = ctranspose(v)*A*v;

while error>tol
    y = A*v;
    rho = (ctranspose(v)*y)/(ctranspose(v)*v);
    r = y - rho*v;
    
    if step+1>eLength %effective memory usage
        lambda(2*step) = 0;
        eLength = eLength*2;
    end
    
    step=step+1;
    error = norm(r)/norm(y);
    lambda(step) = ctranspose(v)*A*v;
    v = y/norm(y);
    
end

lambda = lambda(1:nnz(lambda));
