%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pluFact.m
%
% DESCRIPTION
%   Decomposes a matrix A using LU factorization with optional partial pivoting.
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - NxN matrix
%
% OUTPUT
%   A - Decomposed L/U matrix for efficient space storage
%   P - pivoting vector
%
% NOTES
%   Asserts the size of the input matrix
%   Updating the submatrix was taken directly from the textbook
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [A,p] = pluFact(A,~)

[m,n] = size(A);
assert(m == n,'Please insert square matrix')
p = 1:n;

for i = 1:n-1
    J = i+1:n;
    if nargin > 1
        %First, find the maximum row to swap with
        [~,loc] = max(abs(A(i:n,i)));
        loc = loc + i-1;
        
        %Swap row i with row loc and also in p
        A([i,loc],:) = A([loc,i],:);
        p([i,loc]) = p([loc,i]);
    end
    
    %Now replace the "eliminated" elements with their elimination constant
    A(J,i) = A(J,i) / A(i,i);
    
    %And then do the elimination on the rest of the matrix
    A(J,J) = A(J,J) - A(J,i) * A(i,J);
end
end