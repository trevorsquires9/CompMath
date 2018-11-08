%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ROOTFINDER.m
%
% DESCRIPTION
%   Probes a given function for possible roots between specified bounds.
%   Proceeds to find all roots in the bounds. 
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   f - function handle
%   a - lower bound for searching
%   b - upper bound for searching
%   pts - the number of points to initially probe by
%   tol - tolerance for quiting
%
% OUTPUT
%   roots - the roots of f between a and b
%
% NOTES
%   The function f must satisfy the fixed point theorem requirements
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [roots] = rootFinder(f,a,b,pts,tol)

t = a:(b-a)/(pts-1):b;

currentSign = sign((f(t(1))));
bounds = 1;

for i = 2:pts
    if currentSign*sign(f(t(i))) < 0
        currentSign = currentSign*-1;
        bounds = [bounds i];
    end
end

n = length(bounds)-1;
roots = zeros(1,n);

for i = 1:n
    %iterates = bisection(f,t(bounds(i)),t(bounds(i+1)),tol); 
    %or 
    iterates = secant(f,t(bounds(i)),t(bounds(i+1)),tol); 
    roots(i) = iterates(end);
end
    
