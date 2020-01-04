%%%%%%%%%%%%%%%%%%%%%%%%%%%
% simulIter.m
%
% DESCRIPTION
%   Naive simultaneous iteration
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - n x n matrix
%   maxIt - iterations to run for
%
% OUTPUT
%   H - output matrix T with eigenvalues along diagonal
%
% NOTES
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Hk] = simulIter(A,maxIt)

n = length(A);
Qk = zeros(n^2,maxIt);
Hk = zeros(n^2,maxIt);
Hk(:,1) = reshape(A,[n^2 1]);


Qk(:,1) = reshape(eye(n),[n^2 1]);

for i = 1:maxIt
    Z = A*reshape(Qk(:,i),[n n]);
    [Q,R] = qr(Z);
    Q = Q*diag(sign(diag(R)));
    Qk(:,i+1) = reshape(Q,[n^2 1]);
    Hk(:,i+1) = reshape(Q'*A*Q,[n^2 1]);
    
end