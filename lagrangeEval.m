%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LAGRANGEEVAL.m
%
% DESCRIPTION
%   Computes l(x0) using given weights and classical formula
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   x - n x 1 vector of distinct abcissa points
%   y - n x 1 vector of ordinate points
%   x0 - m x 1 vector of evaluation points
%
% OUTPUT
%   px - Lagrange interpolation evaluated at x0
%
% NOTES
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [px] = lagrangeEval(x,y,x0)

m = length(x0);
n = length(x);
px = zeros(1,m);

for k = 1:m
    Lx = ones(1,n);
    for j = 1:n
        for i = 1:n
            if j~=i
                Lx(j) = Lx(j)*(x0(k)-x(i))/(x(j)-x(i));
            end
        end
    end
    
    for i = 1:n
        px(k) = px(k)+y(i)*Lx(i);
    end
end