%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HOUSE.m
%
% DESCRIPTION
%   Decomposes a rectangular matrix A in rectangular matrix Q and square
%   upper triangular matrix R householder transformations
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - m x n  matrix
%
% OUTPUT
%   v - matrix of vectors corresponding to Householder transformations
%   R - n x n upper triangular matrix
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [v,R] = house(A)
[m,n] = size(A);
v = zeros(m,n);

for k = 1:n
    x = A(k:m,k);
    v(k:m,k) = sign(x(1))*norm(x,2)*eye(m-k+1,1) + x;
    v(k:m,k) = v(k:m,k)/norm(v(k:m,k),2);
    A(k:m,k:n) = A(k:m,k:n) - 2*v(k:m,k)*(v(k:m,k)'*A(k:m,k:n));
end
R = A(1:n,:);
end