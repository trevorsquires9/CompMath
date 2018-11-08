%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BACKSUB.m
%
% DESCRIPTION
%   Solves Ax = b using backwards substituion
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
%   Asserts the size of matrix/vector as well as lower triangularity
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x] = backSub(A,b)

sizeA = size(A);
sizeB = size(b);

if sizeB(1) < sizeB(2)
    b = b';
end


n = sizeA(1);
x = zeros(n,1);
x(n) = b(n)/A(n,n);

for k = n-1:-1:1
    x(k) = (b(k) - A(k,k+1:n)*x(k+1:n))/A(k,k);
end

end

