%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BARYEVAL2.m
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
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [lx] = baryEval2(x,y,mu,x0)

m = length(x0);
n = length(x);
lx = zeros(1,m);

for j = 1:m
    num = 0;
    denom = 0;
    for i=1:n
        tmpDenom =  mu(i)/(x0(j)-x(i));
        denom = denom+tmpDenom;
        num = tmpDenom*y(i) + num;
    end
    lx(j) = num/denom;
    
end
end

