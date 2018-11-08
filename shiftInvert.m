%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SHIFTINVERT.m
%
% DESCRIPTION
%   Uses the shift invert method to compute the closest eigenpair to alpha of a matrix A
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - n x n matrix
%   v0 - 1 x n vector of initial guess for eigenvector
%   alpha - shift value
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



function [lambda,v] = shiftInvert(A,v0,alpha,tol)

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

shiftA = (A-alpha*eye(m));
[T,p] = pluFact(shiftA,'pivot');


while error>tol
    y = pluSolve(T,p,v); %solve using PLU factorization
    Ax = A*v; %precompute for later steps
    lambda(step) = (ctranspose(v)*Ax)/(ctranspose(v)*v);
    r = Ax - lambda(step)*v;
    
    if step+1>eLength %effective memory usage
        lambda(2*step) = 0;
        eLength = eLength*2;
    end
    
    step=step+1;
    error(step) = norm(r)/norm(Ax);
    lambda(step) = ctranspose(v)*A*v;
    v = y/norm(y);
    
end

lambda = lambda(1:nnz(lambda));
