%%%%%%%%%%%%%%%%%%%%%%%%%%%
% shiftedQR.m
%
% DESCRIPTION
%   Performs QR decomposition using efficient Wilkinson shifts and
%   deflation. 
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - n x n matrix
%   maxIt - iterations until we stop
%   tol - tolerance for deflation
%
% OUTPUT
%   myEigs - vector of eigenvalues
%   it - total number of iterations (not necessarily on an n x n matrix)
%   executed. Returns empty if executed all maxIt
%
% NOTES
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [solu] = semiDirectLinearSolver(A,b,M,MInv,x0,it)
%% Initialize Variables
n = length(A);
solu = zeros(n,it);
solu(:,1) = x0;

for i = 1:it-1
    solu(:,i+1) = MInv(M*solu(:,i) - A*solu(:,i) + b);
end
