%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMPBOOLE.m
%
% DESCRIPTION
%   Uses  composite booles rule to approximate the integral of f(x)
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   f - function handle
%   a - left endpoint
%   b - right endpoint
%   n - number of subintervals
%
% OUTPUT
%   int_approx - approximation of int_a^b f(x)
%
% NOTES
%   Could be improved by removing duplicate function evaluations, but it is
%   of minimal improvement and detracts from what is going on. 
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [int_approx] = compBoole(f,a,b,n)
assert(mod(n,4)==0, 'Subintervals must be a multiple of four')

h = (b-a)/n;
pts = linspace(a,b,n+1);
int_approx = 0;

for i = 1:4:n-1
    int_approx = int_approx + 7*(f(pts(i))+f(pts(i+4))) ... 
    + 32*(f(pts(i+1))+f(pts(i+3))) + 12*f(pts(i+2));
end

int_approx = int_approx*h*4/90;