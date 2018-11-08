%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LAGRANGEEVAL2.m
%
% DESCRIPTION
%   Computes l(x0) using given weights and type 2 formula
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   x - n x 1 vector of distinct abcissa points
%   y - n x 1 vector of ordinate points
%   mu - barycentric weights
%   x0 - m x 1 vector of evaluation points
%
% OUTPUT
%   lx - Lagrange interpolation evaluated at x0
%
% NOTES
%   Asserts the size of each vector
%   Requires all points in x and x0 to be distinct (for nonsingularity)
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [lx] = lagrangeEval2(x,y,mu,x0)

m = length(x0);
n = length(x)-1;
num = 0;
denom = 0;

for i=0:n
    num = y(i+1)*mu(i+1)/(x0-x(i+1)) + num;
    denom = mu(i+1)/(x0-x(i+1)) + denom;
end
lx = num/denom;

end

