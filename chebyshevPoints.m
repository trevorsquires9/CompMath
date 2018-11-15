%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CHEBYSHEVPOINTS.m
%
% DESCRIPTION
%   Computes Chebyshev points
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   a - upper bound
%   b - lower bound
%   n - number of points
%
% OUTPUT
%   x - vector of interpolation points
%
% NOTES
%   
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x] = chebyshevPoints(a,b,n)

if a>b
    tmp = b;
    b = a;
    a = tmp;
end

x = zeros(1,n);

for i = 1:n+1
    x(i) = -((b-a)/2)*cos((i-1)*pi/n)+(a+b)/2;
end
