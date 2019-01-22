%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue
%   Homework 6
%
% Question
%   Problem 10.6
%
% Function Dependencies
%   monoInterp.m
%   baryWeights.m
%   divdif.m
%   baryEval2.m
%   evalNewt.m
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

x = [-1 0 1 2];
y = [1 1 2 0];

%% Interpolation
monoCoeff= monoInterp(x,y);
lagrangeCoeff = baryWeights(x);
[newtonCoeff,table] = divdif(x,y);

%% Evaluation
t = sort(rand(1,1000)*3-1,'descend');
monoY = polyval(monoCoeff,t);
lagrangeY = baryEval2(x,y,lagrangeCoeff,t);
newtonY = evalNewt(x,newtonCoeff,t);

%% Plotting
plot(t,monoY,'-')
hold on
plot(t,lagrangeY,'--')
hold on
plot(t,newtonY,'.-')
title('Three representations of p_n(x)')
xlabel('x')
ylabel('p_n(x)')
legend('Monomial','Lagrange','Newton','Location','Best')

%% Total error
err1 = norm(monoY-lagrangeY);
err2 = norm(monoY-newtonY);
err3 = norm(newtonY-lagrangeY);
err = sum(err1+err2+err3);