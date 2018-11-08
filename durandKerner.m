%%%%%%%%%%%%%%%%%%%%%%%%%%%
% durandKerner.m
%
% DESCRIPTION
%   Finds a root of a polynomial using the Durand–Kerner method
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   a - vector of polynomial coefficients
%   tol - absolute tolerance for quiting
%
% OUTPUT
%   roots - roots of the polynomial defined by a
%
% NOTES
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [old_roots] = durandKerner(a,tol)

n = length(a)-1;
new_roots = zeros(1,n);
for j = 1:n
    new_roots(j) = (0.4+0.9i)^(j-1);
end
error = 1;

while error > tol
    old_roots = new_roots;
    new_roots = zeros(1,n);
    for j = 1:n
        denom = 1;
        %generate denominator 
        for k = 1:n 
            if j ~= k
                denom = denom*(old_roots(j) - old_roots(k));
            end
        end
        %system of fixed point iterations
        new_roots(j) = old_roots(j) - polyval(a,old_roots(j))/denom;
    end
    error = norm(new_roots-old_roots);
end