%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pluExtract.m
%
% DESCRIPTION
%   Returns the P,L,and U matrices from the pluFact return matrix
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - NxN matrix that is output from pluFact
%   p - Nx1 matrix that is output from pluFact
%
% OUTPUT
%   P - partial pivoting matrix
%   L - lower triangular matrix
%   U - upper triangluar matrix
%
% NOTES
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [P,L,U] = pluExtract(A,p)
n = length(A);

U = triu(A);
L = tril(A);
L(1:n+1:n^2) = ones(1,n);

P = eye(n);
for i = 1:n
    P(i,i) = 0;
    P(i,p(i)) = 1;
end
end