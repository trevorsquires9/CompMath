%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NORMALEQ.m
%
% DESCRIPTION
%   Minimizes ||Ax-b|| using the normal equations
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - n x m  matrix
%   b - n x 1 vector
%
% OUTPUT
%   x - minimizer of ||Ax-b||
%
% NOTES
%   Asserts dimensions of vector is appropriate
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [x] = normalEq(A,b)

[m,~] = size(A);
[row,col] = size(b);

assert(min(row,col) == 1)
assert(max(row,col) == m)

if row == 1
    b = b';
end

B = A'*A; %form normal equations
y = A'*b;

G = cholDecomp(B);

z = forwardSub(G,y);
x = backSub(G',z);

end