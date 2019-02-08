%%%%%%%%%%%%%%%%%%%%%%%%%%%
% qrmgs.m
%
% DESCRIPTION
%   Decomposes a rectangular matrix A in rectangular matrix Q and square
%   upper triangular matrix R using modified gram schmidt
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

function [Q,R] = qrmgs(A)
[~,n] = size(A);

Q = A;
R = zeros(n);
for k = 1:n
    R(k,k) = norm(Q(:,k));
    Q(:,k) = Q(:,k)/R(k,k);
    
    for j = k+1:n
        R(k,j) = Q(:,k)'*Q(:,j);
        Q(:,j) = Q(:,j)-R(k,j)*Q(:,k);
    end
end
