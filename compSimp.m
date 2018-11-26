%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMPSIMP.m
%
% DESCRIPTION
%   Uses composite simpsons rule to approximate the integral of f(x)
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
%   Indexing is terrible because Matlab starts indexing at 1 not 0
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [int_approx] = compSimp(f,a,b,n)
assert(mod(n,2)==0, 'Subintervals must be even')
h = (b-a)/n;
pts = linspace(a,b,n+1);

twoSum = 0;
fourSum = 0;

for i = 1:n/2
    index = 2*i;
    fourSum = fourSum + f(pts(index));
end

for i = 2:n/2
    index = 2*i-1;
    twoSum = twoSum + f(pts(index));
end

int_approx = f(pts(1)) + 4*fourSum + 2*twoSum + f(pts(end));
int_approx = int_approx*h/3;
