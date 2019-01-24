%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cramersRule.m
%
% DESCRIPTION
%   Solves a system of equations Ax = b using Cramer's Rule
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - n x n  matrix
%   b - n x 1 vector
%
% OUTPUT
%   x - solution to Ax = b
%
% NOTES
%   Issues a warning if matrix is rank deficient
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x] = cramersRule(A,b)

%Check sizes of inputs
[m,n] = size(A);
assert(m == n);
assert(isvector(b));
assert(n == length(b));
[m,n] = size(b);

if m<n
    b = b';
end

n = length(b);
x = zeros(n,1);
detA = det(A);

for i = 1:n
    tmpA = A;
    tmpA(:,i) = b;
    x(i) = det(tmpA)/detA;
end
