%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue
%   Homework 4
%
% Question
%   Problem 2
%
% Function Dependencies
%   qrgs.m
%
% Notes
%   Does computations with QR factorization of rank deficient matrix A3
%
% Author
%   Trevor Squires
%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all;

%% Matrices
A = cell(1,3);
Q = cell(1,3);
R = cell(1,3);

A{1} = rand(16384,20);
tmpA = fliplr(vander(linspace(-1,1,10000)));
A{2} = tmpA(:,1:25);
A{3} = tmpA(:,1:45);

%% Output
for i = 1:3
    [Q{i},R{i}] = qrgs(A{i});
    n = size(R{i});
    fprintf('For matrix A%d\n',i)
    fprintf('\t||Q^T Q - I|| = %e\n',norm(Q{i}'*Q{i} - eye(n)))
    fprintf('\t||QR-A||/||A|| = %e\n',norm(Q{i}*R{i}-A{i})/norm(A{i}))
end
