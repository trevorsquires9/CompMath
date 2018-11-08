%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pluSolve.m
%
% DESCRIPTION
%   Solves Ax = b using precomputed PLU factorization
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   T - NxN matrix computed from pluFact.m
%   p - permutation vector form pluFact.m
%   b - Nx1 vector
%
% OUTPUT
%   x - solution to Ax = b
%
% NOTES
%   None
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x] = pluSolve(T,p,b)

n = length(T);
b = b(p); %repermute

diagonal = diag(T);
T(1:n+1:n^2) = ones(1,n); %change the diagonal in the combined LU matrix
y = forwardSub(T,b); %solve Ly = b
T(1:n+1:n^2) = diagonal;
x = backSub(T,y); %solve Ux = y

end