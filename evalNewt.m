%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EVALNEWT.m
%
% DESCRIPTION
%   Evaluate the Newton polynomial at x0
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   x - n x 1 vector of distinct abcissa points
%   coeff - coefficients computed previously
%   x0 - point to be evaluated at
%
% OUTPUT
%   p - evaluation at x0
%
% NOTES
%   Asserts the size of each vector
%
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [p] = evalNewt(x,coeff,x0)

n = length(x);
p = coeff(n)*ones(size(x0));

for i = n-1:-1:1
    p = p.*(x0-x(i))+coeff(i);
end

end