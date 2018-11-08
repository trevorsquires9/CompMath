%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CUBICSPLINE.m
%
% DESCRIPTION
%   Computes the coefficients of a cubic spline interpolant of the given
%   data.  This particular function does not allow users to specify which
%   cubic spline and always enforces the natural spline. 
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   x - N x 1 vector of distinct abcissa points
%   y - N x 1 vector of distinct abcissa points
%   x0 - point to be evaluated at
%
% OUTPUT
%   a - degree 0 coefficient
%   b - degree 1 coefficient
%   c - degree 2 coefficient
%   d - degree 3 coefficient
%
% NOTES
%   Still confused on the computation of c,b,d
%
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [a,b,c,d] = cubicSpline(x,y)

n = length(x)-1;

a = y(1:n);
b = zeros(1,n);
c = zeros(1,n+1);
d = zeros(1,n);
h = zeros(1,n);
phi = zeros(1,n-2);

%% Compute h
for i = 1:n
    h(i) = x(i+1)-x(i);
end

%% Compute c
mainDiag = (h(1:end-1)+h(2:end))*2;
minorDiag = h(2:end-1);
cMat = diag(mainDiag,0) + diag(minorDiag,1) + diag(minorDiag,-1);

for i = 1:n-1
    phi(i) = 3*((y(i+1)-y(i+2)) / (x(i+1)-x(i+2)) - (y(i) - y(i+1))/(x(i)-x(i+1)));
end

c(2:end-1) = cMat\phi';

%% Compute d
for i = 1:n
    d(i) = (c(i+1)-c(i))/3./h(i);
end

%% Compute b
for i = 1:n
    b(i) = ((y(i)-y(i+1))/(x(i)-x(i+1))) - h(i)/3*(2*c(i) + c(i+1));
end


end
