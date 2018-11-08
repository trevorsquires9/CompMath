%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BARYEVAL1.m
%
% DESCRIPTION
%   Computes l(x0) using given weights and type 1 formula
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
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [lx] = baryEval1(x,y,mu,x0)
m = length(x0);
n = length(x);
lx = zeros(1,m);

for j = 1:m
    psix = 1;
    for i=1:n
        lx(j) = y(i)*mu(i)/(x0(j)-x(i)) + lx(j);
        psix = psix*(x0(j)-x(i));
    end
    lx(j) = lx(j)*psix;
    
end
end

