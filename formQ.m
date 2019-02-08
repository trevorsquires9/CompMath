%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FORMQ.m
%
% DESCRIPTION
%   Given an output v from house.m, formQ(v) produces the orthogonal Q
%   matrix in the reduced QR factorization such that A = QR 
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   v - vector of Householder vectors computed in house.m
%
% OUTPUT
%  	Q - m x n orthogonal matrix
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Q] = formQ(v)
[m,n] = size(v);

Q = zeros(m,n);

for i = 1:n
    x = zeros(m,1);
    x(i) = 1;
    
    Q(:,i) = houseEval(v,x,0);
end
    
    
    
    
    