%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spring 2018 Math 8610 w/ Xue
%   Homework 2
%
% Problem
%   7 - Trefethen 11.2
%
% Function Dependencies
%   None
%
% Notes
%   Quite a terrible script.  But it got the job done. 
%
% Author
%   Trevor Squires
%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all;

interval = [1,2];
n = 50;
t = linspace(interval(1),interval(2),n);
f = @(t) 1./t;


u1 = @(x) sin(x);
u2 = @(x) exp(x);
u3 = @(x) Gamma(x);

v1Norm = sqrt(integral(@(x) sin(x).^2,interval(1),interval(2)));
v1 = @(x) u1/v1Norm;

v2Coeff1 = integral(@(x) exp(x).*sin(x)/v1Norm,interval(1),interval(2))/v1Norm;

v2 = @(x) exp(x) - v2Coeff1*sin(x);
v2Norm = sqrt(integral(@(x)(exp(x) - v2Coeff1*sin(x)).^2,interval(1),interval(2)));

v3Coeff1 = integral(@(x) gamma(x).*sin(x)/v1Norm^2,interval(1),interval(2));
v3Coeff2 = integral(@(x) gamma(x).*(exp(x)-v2Coeff1.*sin(x))/v2Norm^2,interval(1),interval(2));
v3Norm = sqrt(integral(@(x) (gamma(x) - v3Coeff1*sin(x) - v3Coeff2*(exp(x) - v2Coeff1*sin(x))).^2,interval(1),interval(2)));

%% Form approximation
Coeff1 = integral(@(x) 1./x .* sin(x),interval(1),interval(2))/v1Norm^2;
Coeff2 = integral(@(x) 1./x .* (exp(x) - v2Coeff1*sin(x)),interval(1),interval(2))/v2Norm^2;
Coeff3 = integral(@(x) 1./x .* (gamma(x) - v3Coeff1*sin(x) - v3Coeff2*(exp(x) - v2Coeff1*sin(x))),interval(1),interval(2))/v3Norm^2;

g = @(x) Coeff1*sin(x)/v1Norm + Coeff2*(exp(x) - v2Coeff1*sin(x)) + Coeff3*(gamma(x) - v3Coeff1*sin(x) - v3Coeff2*(exp(x) + v2Coeff1*sin(x)));
ft = f(t);
gt = g(t);
plot(t,ft,t,gt)
legend ('f(t)','g(t)')
title('Approximation of 1/x by linear combinations of sin(x),exp(x), and gamma(x)')



