%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CHOLDECOMP.m
%
% DESCRIPTION
%   Decomposes a PSD matrix into its cholesky decomposition
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - NxN PSD matrix
%
% OUTPUT
%   A - lower triangular matrix s.t GG^T = A
%
% NOTES
%   Outputs a LOWER triangular matrix
%   Would like to remove nested for loop (line 32)
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [A] = cholDecomp(A)

[~,n] = size(A);

for k = 1:n-1
    A(k,k) = sqrt(A(k,k));
    A(k+1:n,k) = A(k+1:n,k)/A(k,k);
    for j = k+1:n
        A(j:n,j) = A(j:n,j) - A(j,k)*A(j:n,k);
    end
end
A(n,n) = sqrt(A(n,n));
A = tril(A);
end



