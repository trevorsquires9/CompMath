%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HOUSEHOLDER.m
%
% DESCRIPTION
%   Performs QR decomposition using house holder reflections
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - m x n matrix
%   
% OUTPUT
%   A
%   p
% NOTES
%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [A,p] = houseHolder(A)

[m,n] = size(A);
p = zeros(1,n);

for k = 1:n
    z = A(k:m,k);
    e1 = [1; zeros(m-k,1)];
    u = z+sign(z(1))*norm(z)*e1;
    u = u/norm(u);
    
    A(k:m,k:n) = A(k:m,k:n)-2*u*(u'*A(k:m,k:n));
    
    p(k) = u(1);
    A(k+1:m,k) = u(2:m-k+1);
end
