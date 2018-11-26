%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMPTRAPCORR.m
%
% DESCRIPTION
%   Uses corrected composite trapezoid rule to approximate the integral of f(x)
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   f - function handle
%   fprime - derivative handle
%   a - left endpoint
%   b - right endpoint
%   n - number of subintervals
%
% OUTPUT
%   int_approx - approximation of int_a^b f(x)
%
% NOTES
%   None
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [int_approx] = compTrapCorr(f,fprime,a,b,n)

h = (b-a)/n;
pts = linspace(a,b,n+1);
sum = 0;

for i = 2:n
    sum = sum + f(pts(i));
end

int_approx = h/2 * (f(pts(1)) + 2*sum + f(pts(end))) + (h^2)/12 * ...
    (fprime(pts(1)) - fprime(pts(end)));
end