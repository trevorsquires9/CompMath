%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CUBICSPLINEEVAL.m
%
% DESCRIPTION
%   Evaluates a function using its cubic spline approximation previously
%   computed. See cubicSpline.m for more information. 
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   a - degree 0 coefficient
%   b - degree 1 coefficient
%   c - degree 2 coefficient
%   d - degree 3 coefficient
%   x - input data previously used
%   x0 - point to be evaluated at
%
% OUTPUT
%   fx - function evaluation at x0
%
% NOTES
%   Tested in cubicSplineTest.m and seems to be working fine
%
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [fx] = cubicSplineEval(a,b,c,d,x,x0)

n = length(x);
i = 2;

while x0 > x(i)
    i = i+1;
    if i > n
        i = n;
        break;
    end
end
int = i-1;
y = x0-x(int);

fx = a(int) + b(int)*y + c(int)*y^2 + d(int)*y^3;

end



