%%%%%%%%%%%%%%%%%%%%%%%%%%%
% polyNewton.m
%
% DESCRIPTION
%   Performs Newton's method on a polynomial
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   c - vector of polynomial coefficients
%   x0 - starting point
%   tol - absolute tolerance for quiting
%
% OUTPUT
%   roots - vector of all roots
%
% NOTES
%   
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [root] = polyNewton(a,x0,tol)

%% First compute the derivative in coefficient form using power rule
n = length(a);
b = zeros(1,n-1);
for i = 1:n-1
    b(i) = (n-i)*a(i);
end

%% Now do Newton's iteration using initial guess
error = tol+1;
old_x = x0;
new_x = old_x;

while error > tol
    old_x = new_x;
    new_x = old_x - polyval(a,old_x)/polyval(b,old_x);
    error = abs(new_x-old_x);
end

root = new_x;