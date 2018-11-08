%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GAUSSELIM.m
%
% DESCRIPTION
%   Reduces Ax = b into an upper triangular form. To be used with backSub.m
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - NxN matrix
%   b - Nx1 vector
%
% OUTPUT
%   A - upper triangular matrix "equivalent" to A
%   b - modified vector b
%
% NOTES
%   Asserts the size of matrix/vector
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [A,b] = gaussElim(A,b)

sizeA = size(A);
sizeB = size(b);

assert(sizeA(2) == sizeA(1))



if sizeB(1) < sizeB(2)
    b = b';
    sizeB = size(b);
end

assert(sizeA(1) == sizeB(1) && sizeB(2) == 1)


Aug = [A b];

n = sizeA(1);


for k = 1:n-1
    for i = k+1:n
        multiplier = Aug(i,k)/Aug(k,k);
        Aug(i,:) = Aug(i,:)-multiplier*Aug(k,:);
    end
end

A = Aug(:,1:sizeA(1));
b = Aug(:,sizeA(1)+1:end);


end

