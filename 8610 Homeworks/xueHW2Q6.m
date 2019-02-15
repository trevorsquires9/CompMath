%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spring 2018 Math 8610 w/ Xue
%   Homework 2
%
% Problem
%   6 - Trefethen 11.3
%
% Function Dependencies
%   house.m
%   formQ.m
%   houseEval.m
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

m = 50;
n = 12;
t = linspace(0,1,m);

A = fliplr(vander(t));
A = A(:,1:12);
b = cos(4*t)';
problem = cond(A);
error = zeros(1,5);


%% Matlab Backslash (solution)
solu = A\b;

%% Normal Equations
R = cholDecomp(A'*A);
normalCoeff = backSub(R',forwardSub(R,A'*b));
error(1) = norm(solu-normalCoeff);

%% MGS
[Q,R] = qrmgs(A);
mgsCoeff = backSub(R,Q'*b);
error(2) = norm(solu-mgsCoeff);

%% Householder
[v,R] = house(A);
y = houseEval(v,b,1);
houseCoeff = [R; zeros(m-n,n)]\y;
error(3) = norm(solu-houseCoeff);

%% Matlab QR
[Q,R] = qr(A);
matqrCoeff = R\Q'*b;
error(4) = norm(solu-matqrCoeff);

%% Matlab SVD
[U,Sigma,V] = svd(A);
matsvdCoeff = V*(Sigma\(U'*b));
error(5) = norm(solu-matsvdCoeff);
