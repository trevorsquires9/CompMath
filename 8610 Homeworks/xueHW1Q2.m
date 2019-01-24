%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spring 2018 Math 8610 w/ Xue 
%   Homework 1   
%
% Problem
%   2
%
% Function Dependencies
%   None
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

length = 20;
f = @(k) (6.^(k+1) + 5.^(k+1))./(6.^k + 5.^k);
xk = zeros(1,length);
fk = f(0:length-1);
xk(1) = 11/2;
xk(2) = 61/11;

for i = 2:length-1
    xk(i+1) = 111 - (1130-3000/xk(i-1))/xk(i);
end

plot(1:length, xk,'r*', 1:length, fk, '-k')
title('Sequence Evaluations')
ylabel('x_k')
xlabel('k')
legend('Sequential Evaluation','General Evaluation','location','northwest')

