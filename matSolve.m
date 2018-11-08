%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BACKSUB.m
%
% DESCRIPTION
%   Solves Ax = b using LU factorization with optional partial pivoting
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - NxN matrix
%   b - Nx1 vector
%
% OUTPUT
%   x - solution to Ax = b
%
% NOTES
%   Asserts the matrix is square and the vector is of appropriate length
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x] = matSolve(A,b,~)
%% Assertions
n = size(A);
assert(n(1) == n(2))

assert(isvector(b));
assert(length(b) == n(1));

n = n(1);

%% Solving Ax = b
if nargin > 2
    [A,p] = pluFact(A,'pivot'); %factorize with pivoting
else
    [A,p] = pluFact(A); %factorize without pivoting
end
b = b(p); %repermute

diagonal = diag(A);
A(1:n+1:n^2) = ones(1,n); %change the diagonal in the combined LU matrix
y = forwardSub(A,b); %solve Ly = b
A(1:n+1:n^2) = diagonal;

x = backSub(A,y); %solve Ux = y


end
