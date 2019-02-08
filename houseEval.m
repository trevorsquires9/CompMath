%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HOUSEEVAL.m
%
% DESCRIPTION
%   Given a matrix of v factors of house.m and a vector b, computes Q'b or
%   Qb
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   v - matrix of factors from house.m
%   b - vector in Qb or Q'b
%   transpose - boolean variable that determines which calculation to
%   perform
%
% OUTPUT
%   b - either Q'b or Qb
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [b] = houseEval(v,b,transpose)
[m,n] = size(v);

if transpose
    for k = 1:n
        b(k:m) = b(k:m) - 2*v(k:m,k)*(v(k:m,k)'*b(k:m));
    end
else
    for k = n:-1:1
       b(k:m) = b(k:m) - 2*v(k:m,k)*(v(k:m,k)'*b(k:m));
    end
end