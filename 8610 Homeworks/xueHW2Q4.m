%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spring 2018 Math 8610 w/ Xue
%   Homework 2
%
% Problem
%   4
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

clear
clc
close all;

m = 41;
n = 5:4:37;

matrixCount = 9;
A = cell(matrixCount,1);
u = (-1:2/40:1)';
condition= zeros(matrixCount,1);

for i = 1:matrixCount
    A{i} = u.^(0:4*i);
    condition(i) = cond(A{i});
end

myBackErr = zeros(1,matrixCount);
matBackErr = zeros(1,matrixCount);


%% Evaluation 
for i = 1:matrixCount
    powers = (2:n(i)+1)';
    solu = (-1*ones(n(i),1)).^powers;
    b = A{i}*solu;
    
    [v,R] = house(A{i});
    y = houseEval(v,b,1);
    mySolu = [R;zeros(m-n(i),n(i))]\y;
    matSolu = A{i}\b;
    
    myBackErr(i) = norm(b-A{i}*mySolu,2)/norm(A{i},2)/norm(mySolu,2);
    matBackErr(i) = norm(b-A{i}*matSolu,2)/norm(A{i},2)/norm(matSolu,2);
end
    
    
    
    
    