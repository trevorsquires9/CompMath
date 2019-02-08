%%%%%%%%%%%%%%%%%%%%%%%%%%%
% qrmgs2.m
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

function [Q,R] = qrmgs2(A)

[Q1,R1] = qrmgs(A);
[Q,R2] = qrmgs(Q1);
R = R2*R1;
end
