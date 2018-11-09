%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BISECTION.m
%
% DESCRIPTION
%   Finds a root of a given function using the bisection method
%
% AUTHOR
%   Trevor Squires
% 
% ARGUMENTS
%   f - function handle
%   a - left end point
%   b - right endpoint
%   tol - absolute tolerance for quiting
%
% OUTPUT
%   history - vector of previous iterates
%
% NOTES
%   Requires [a,b] to bracket the root.
%   Precomputes number of iterations to better store iterates.
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [history] = bisection(f,a,b,tol)

fa = f(a);
fb = f(b);

if fa*fb > 0
    error('Please bracket the root appropriately');
end

c = (a+b)/2;
fc = f(c);

n = ceil(log2((b-a)/(2*tol)))-1; %precompute number of iterations
history = zeros(1,n);


for i = 1:n
    if fc ==0
        break;
    elseif fc*fa > 0
        a = c;
        fa = fc;
    else
        b = c;
    end
    c = (a+b)/2;
    fc = f(c);
    history(i) = c;

end

