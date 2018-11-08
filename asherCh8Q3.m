%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue 
%   Homework 5   
%
% Question
%   8.3
%
% Function Dependencies
%   powerMethod.m
%   shiftInvert.m
%
% Notes
%   Performs power method on two dense matrices and discusses convergence.
%
% Author
%   Trevor Squires
%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all;

u = 1:32;
v = [1:30,30,32];
M = randn(32,32);
[Q,R] = qr(M);
A = Q*diag(u)*Q';
B = Q*diag(v)*Q';

tol = 1e-6;
v0 = ones(1,32);

%% Power Method
[lambdaA,~] = powerMethod(A,v0,tol);
[lambdaB,~] = powerMethod(B,v0,tol);

lengthA = nnz(lambdaA);
lengthB = nnz(lambdaB);

figure();
semilogy(abs(32-lambdaA),'--');
hold on
semilogy(abs(32-lambdaB),'-');
xlabel('Iteration')
ylabel('Absolute Error')
legend('A','B')
title('Power Method')


fprintf('Using the power method, ')
fprintf('matrix A took %d iterations to converge while matrix B took %d iterations.\n',lengthA,lengthB)

%% Shift Invert Method with alpha = cond(A)
[lambdaAShift,~] = shiftInvert(A,v0,cond(A,inf),tol);
[lambdaBShift,~] = shiftInvert(B,v0,cond(B,inf),tol);

lengthAShift = nnz(lambdaAShift);
lengthBShift = nnz(lambdaBShift);

figure();
semilogy(abs(32-lambdaAShift),'--');
hold on
semilogy(abs(32-lambdaBShift),'-');
xlabel('Iteration')
ylabel('Absolute Error')
legend('A','B')
title('Shift Invert Method')

fprintf('Using the shift invert method with alpha = cond(A), ')
fprintf('matrix A took %d iterations to converge while matrix B took %d iterations.\n',lengthAShift,lengthBShift)