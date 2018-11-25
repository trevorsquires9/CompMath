%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMPTRAP.m
%
% DESCRIPTION
%   Uses composite trapezoid rule to approximate the integral of f(x)
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
%   None
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [int_approx] = compTrap(f,a,b,n)

h = (b-a)/n;
pts = linspace(a,b,n+1);
int_approx = 0;

for i = 2:n
    int_approx = int_approx + f(pts(i)); %inner sum
end

int_approx = int_approx + f(pts(1))/2 + f(pts(n+1))/2; %end points get added once
int_approx = int_approx*h;
