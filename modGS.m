%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MODGS.m
%
% DESCRIPTION
%   QR factorizes a given square matrix
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - n x m  matrix
%
% OUTPUT
%   Q - orthogonal matrix in decomposition s.t. QR = A
%   R - upper triangular square matrix in decomposition 
%
% NOTES
%   Asserts dimensions of matrix are appropriate
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [Q,R] = modGS(A)
[m,n] = size(A);

if m ~= n
    error('The input must be a square matrix');
end

Q = zeros(n);
R = zeros(n);

for j=1:n
    Q(:,j) = A(:,j);
    for i = 1:j-1
        R(i,j) = Q(:,j)'*Q(:,i);
        Q(:,j) = Q(:,j) - R(i,j)*Q(:,i);
    end
    R(j,j) = norm(Q(:,j),2);
    Q(:,j) = Q(:,j)/R(j,j);


end



