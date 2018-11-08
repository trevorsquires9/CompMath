%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DIVDIF.m
%
% DESCRIPTION
%   Computes coefficients for Newton interpolation
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   x - n x 1 vector of distinct abcissa points
%   y - n x 1 vector of ordinate points
%
% OUTPUT
%   coeff - coefficients of Newton interpolation
%   table - full table of divided differences
%
% NOTES
%   Asserts the size of each vector
%
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [coeff, table] = divdif(x,y)

n = length(x);
m = n-1;
table = zeros(n,n);

x =shiftdim(x);
y = shiftdim(y);

table(1:n,1) = y;

for k = 2:n
    table(k:n,k) = (table(k:n,k-1) - table(k-1:m,k-1))./(x(k:n) - x(1:n-k+1));
end

coeff = diag(table);

end