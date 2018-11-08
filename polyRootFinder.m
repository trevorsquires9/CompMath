%%%%%%%%%%%%%%%%%%%%%%%%%%%
% polyRootFinder.m
%
% DESCRIPTION
%   Finds a root of a polynomial in a given interval
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   a - vector of polynomial coefficients
%   x0 - starting point
%   tol - absolute tolerance for quiting
%
% OUTPUT
%   history - vector of previous iterates
%
% NOTES
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [roots] = polyRootFinder(a,x0,tol)

i = 1;
poly = a;
ini_pt = x0;
roots = zeros(1,length(a));

%% Find the roots
while length(poly) ~= 1
    roots(i) = polyNewton(poly,ini_pt,tol);
    poly = hornerDeflate(poly,roots(i));
    ini_pt = roots(i);
    i = i+1;
end
roots = roots(1:i-1);
end



