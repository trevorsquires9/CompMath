%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LAGRANGECONST.m
%
% DESCRIPTION
%   Computes barycentric weights to be used in evaluation
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   x - n x 1 vector of distinct abcissa points
%   y - n x 1 vector of ordinate points
%
% OUTPUT
%   w - barycentric weights
%
% NOTES
%   Asserts the size of each vector
%   Requires all points in x to be distinct (for nonsingularity)
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [w] = lagrangeConst(x,y)

n = length(x);

if length(y) ~= n
    error('The dimension of x and y must be the same')
end

m = size(y);
if m(1) ~= n
    y = y';
end

w = zeros(1,n);

for i = 1:n
    w(i) = 1;
    for j = 1:n
        if i~=j
            w(i) = w(i)/(x(j)-x(i));
        end
    end
end

end

