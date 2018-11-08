%% Exercise 3.6.15 
clear
clc
close all;

%% Part B
t = 0.1:0.001:1;
f = log(t) + t;
plot(t,f)

%% Part C
f = @(x) x + log(x);
tol = 1e-10;

bisection_history = bisection(f,0.5,0.6,tol);
fixedPoint_history = fixedPoint(@(x) x-0.375*(x+log(x)), 0.5, tol);
newton_history = fixedPoint(@(x) x - (x+log(x))/(1+1/x),0.5,tol);
secant_history = secant(f,0.5,0.6,tol);

fprintf('Bisection Results\n')
iterateAnalysis(bisection_history)

fprintf('\nFixed PointResults\n')
iterateAnalysis(fixedPoint_history)

fprintf('\nNewton Results\n')
iterateAnalysis(newton_history)

fprintf('\nSecant Results\n')
iterateAnalysis(secant_history)