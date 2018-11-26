%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ROMBINT.m
%
% DESCRIPTION
%   Uses romberg integration rule to approximate the integral of f(x)
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   f - function handle
%   a - left endpoint
%   b - right endpoint
%   s - number of subintervals to arrive at
%
% OUTPUT
%   int_approx - approximation of int_a^b f(x)
%
% NOTES
%   Have to improve on initial calculation of R(i,1)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [int_approx] = rombInt(f,a,b,s)
depth = log2(s);
assert(2^depth == s, 'Subintervals must be a power of two')

R = zeros(depth);
subInt = 1;
R(1,1) = compTrap(f,a,b,subInt);

for i = 2:depth
    subInt = subInt*2;
    R(i,1) = compTrap(f,a,b,subInt); %inefficient but I don't quite
    %understand how to make use of the previous computed value
    for j = 2:i
        R(i,j) = R(i,j-1) + (R(i,j-1)-R(i-1,j-1))/(4^(j-1)-1);
    end
end
int_approx = R(depth,depth);
