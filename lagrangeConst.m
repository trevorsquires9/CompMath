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
%
% OUTPUT
%   w - barycentric weights
%
% NOTES
%   Asserts the size of each vector
%   Requires all points in x to be distinct (for nonsingularity)
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [w] = lagrangeConst(x)

n = length(x);

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

