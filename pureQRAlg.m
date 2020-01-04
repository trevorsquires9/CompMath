%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pureQRAlg.m
%
% DESCRIPTION
%   Naive, unshifted QR algorithm
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

function [H] = pureQRAlg(A,maxIt)

n = length(A);
H = zeros(n^2,maxIt);
H(:,1) = A(:);

for i = 1:maxIt
    [Q,R] = qr(reshape(H(:,i),[n n]));
    Q = Q*diag(sign(diag(R)));
    R = diag(sign(diag(R)))*R;
    H(:,i+1) = reshape(R*Q,[n^2 1]);
end