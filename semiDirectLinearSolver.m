%%%%%%%%%%%%%%%%%%%%%%%%%%%
% shiftedQR.m
%
% DESCRIPTION
%   Solves a linear system using a semidirect linear solver (jacobi, gauss-seidel, sor) 
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - n x n matrix
%   b - n x 1 vector
%   M - matrix to "precondition" with (e.g. diag(diag(A)) for jacobi, triu(A) for gauss-seidel)
%   Minv - a function handle that computes a solution z to Mz=y
%   x0 - initial guess
%   it - max iterations to use
%
% OUTPUT
%   solu - approximate solution after it iterations
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
    solu(:,i+1) = MInv(M*solu(:,i) - A*solu(:,i) + b); %iteratively do the update
end
