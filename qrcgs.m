%%%%%%%%%%%%%%%%%%%%%%%%%%%
% QRCGS.m
%
% DESCRIPTION
%   Decomposes a rectangular matrix A in rectangular matrix Q and square
%   upper triangular matrix R
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - m x n  matrix
%
% OUTPUT
%   Q - m x n orthonormal matrix
%   R - n x n upper triangular matrix
%
% NOTES
%   Issues a warning if matrix is rank deficient
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Q,R] = qrcgs(A)

[m,n] = size(A);

Q = zeros(m,n);
R = zeros(n);

for k = 1:n
    for i = 1:k-1
        R(i,k) = Q(:,i)'*A(:,k);
    end
    tmpAk = A(:,k);
    for i = 1:k-1
        tmpAk = tmpAk - Q(:,i)*R(i,k);
    end
    R(k,k) = norm(tmpAk,2);
    Q(:,k) = tmpAk/R(k,k);
end
