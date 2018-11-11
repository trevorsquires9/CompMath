%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LAGRANGEEVAL1.m
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
%   mu - barycentric weights computed previously   
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

function [lx] = lagrangeEval1(x,y,mu,x0)

n = length(x)-1;
lx = 0;
psix = 1;

for i=0:n
    lx = y(i+1)*mu(i+1)/(x0-x(i+1)) + lx;
    psix = psix*(x0-x(i+1));
end
lx = lx*psix;

end

