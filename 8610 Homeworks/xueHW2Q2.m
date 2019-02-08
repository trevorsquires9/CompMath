%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spring 2018 Math 8610 w/ Xue
%   Homework 2
%
% Problem
%   2
%
% Function Dependencies
%   qrcgs.m
%   qrmgs.m
%   qrmgs2.m
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

n = [15 9:4:41];
matrixCount = 10;
A = cell(matrixCount,1);
A{1} = rand(2^20,n(1));
u = (-1:2/40:1)';

condition= zeros(matrixCount,1);
condition(1:2) = [cond(A{1}) cond(A{2})];
for i = 2:matrixCount
    A{i} = u.^(0:4*i);
    condition(i) = cond(A{i});
end



cgs.forErr = zeros(matrixCount,1);
cgs.ortho = zeros(matrixCount,1);
mgs.forErr = zeros(matrixCount,1);
mgs.ortho = zeros(matrixCount,1);
mgs2.forErr = zeros(matrixCount,1);
mgs2.ortho = zeros(matrixCount,1);
hHolder.forErr = zeros(matrixCount,1);
hHolder.ortho = zeros(matrixCount,1);


%% Classical GS
for i = 1:matrixCount
    [Q,R] = qrcgs(A{i});
    cgs.forErr(i) = norm(A{i}-Q*R,'fro')/norm(A{i},'fro');
    cgs.ortho(i) = norm(Q'*Q-eye(n(i)),2);
end

%% Modified GS
for i = 1:matrixCount
    [Q,R] = qrmgs(A{i});
    mgs.forErr(i) = norm(A{i}-Q*R,'fro')/norm(A{i},'fro');
    mgs.ortho(i) = norm(Q'*Q-eye(n(i)),2);
end

%% Double Modified GS
for i = 1:matrixCount
    [Q,R] = qrmgs2(A{i});
    mgs2.forErr(i) = norm(A{i}-Q*R,'fro')/norm(A{i},'fro');
    mgs2.ortho(i) = norm(Q'*Q-eye(n(i)),2);
end

%% Householder Transformation
for i = 1:matrixCount
    [v,R] = house(A{i});
    Q = formQ(v);
    hHolder.forErr(i) = norm(A{i}-Q*R,'fro')/norm(A{i},'fro');
    hHolder.ortho(i) = norm(Q'*Q-eye(n(i)),2);
end

save('HW2Q2','cgs','mgs','mgs2','hHolder','condition')

%% Analysis
load HW2Q2

loglog(condition,cgs.ortho,':')
hold on
loglog(condition,mgs.ortho,'--')
hold on
loglog(condition,mgs2.ortho,'-')
hold on
loglog(condition,hHolder.ortho,'-.')
title('Loglog plot of orthogonal errors')

legend('CGS','MGS','MGS2','HouseHolder','location','best')