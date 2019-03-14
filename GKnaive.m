%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GKNAIVE.m
%
% DESCRIPTION
%   Performs phase 1 of svd computation by converting a matrix A
%   into a bidiagonal matrix
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - m x n  matrix
%
% OUTPUT
%   v - matrix of vectors corresponding to Householder transformations
%   B - n x n bidiagonal matrix
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [A] = GKnaive(A)
[m,n] = size(A);


for k = 1:n
    x = A(k:m,k);
    v = sign(x(1))*norm(x,2)*eye(m-k+1,1) + x;
    v = v/norm(v,2);
    A(k:m,k:n) = A(k:m,k:n) - 2*v*(v'*A(k:m,k:n));
    if k < n-1
        x = A(k,k+1:n);
        v = sign(x(1))*norm(x,2)*eye(1,n-k) + x;
        v = v'/norm(v,2);
        A(k:m,k+1:n) = A(k:m,k+1:n) - 2*(A(k:m,k+1:n)*v)*v';
    end
    
end
end