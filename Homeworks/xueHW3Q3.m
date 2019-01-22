%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue 
%   Homework 3   
%
% Question
%   Problem 3
%
% Function Dependencies
%   pluFact.m
%   pluExtra.m
%
% Notes
%   None
%
% Author
%   Trevor Squires
%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all;

n = [9, 19, 29, 39];
for j = 1:length(n)
    u = -cos((0:n(j))/n(j)*pi);
    A = vander(u);
    matSize = length(A);
    
    [A1] = pluFact(A); %(call your LU factorization without pivoting)
    [A2,p] = pluFact(A,'pivot'); %(call your LU factorization with partial pivoting)
    
    %Adjust my outputs to match expected outputs
    [~,L1,U1] = pluExtract(A1,1:matSize);
    [P,L2,U2] = pluExtract(A2,p);
    
    %Compute error norms
    normReg = norm(A-L1*U1)/norm(A);
    normPivot = norm(P*A-L2*U2)/norm(A);
    nonZReg = [max(abs(nonzeros(L1))) max(abs(nonzeros(U1)))];
    nonZPivot = [max(abs(nonzeros(L2))) max(abs(nonzeros(U2)))];
    
    fprintf('For n = %d\n\t Error without pivoting = %e\n\t\t with values as large as %e, %e in L,U respectively\n',n(j),normReg,nonZReg(1),nonZReg(2))
    fprintf('\t Error with pivoting = %e\n \t\t with values as large as %e, %e in L,U respectively\n\n',normPivot,nonZPivot(1),nonZPivot(2))
end