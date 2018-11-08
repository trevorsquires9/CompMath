%%%%%%%%%%%%%%%%%%%%%%%%%%%
% QRGS.m
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

function [Q,R] = qrgs(A)

[m,n] = size(A);
%assert(rank(A) == min(m,n))
if rank(A) ~= min(m,n)
    warning('Input matrix is rank deficient')
end
Q = zeros(m,n);
R = zeros(n);

for j = 1:n
    Q(:,j) = A(:,j);
    for i = 1:j-1
        R(i,j) = Q(:,j)'*Q(:,i);
        Q(:,j) = Q(:,j) - R(i,j)*Q(:,i);
    end
    R(j,j) = norm(Q(:,j));
    Q(:,j) = Q(:,j)/R(j,j);
end
