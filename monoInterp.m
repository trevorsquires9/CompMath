%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MONOINTERP.m
%
% DESCRIPTION
%   Computes the coefficients for a degree n-1 interpolation
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   x - n x 1 vector of distinct abcissa points
%   y - n x 1 vector of ordinate points
%
% OUTPUT
%   c - coefficients to degree n-1 polynomial
%
% NOTES
%   Asserts the size of each vector
%   Requires all points in x to be distinct (for nonsingularity)
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [c] = monoInterp(x,y)

n = length(x);

if length(y) ~= n
    error('The dimension of x and y must be the same')
end

m = size(y);
if m(1) ~= n
    y = y';
end

mat = zeros(n);
for i = 1:n
    mat(:,i) = x.^(i-1);
end

c = mat\y;


end

