%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue
%   Homework 6
%
% Question
%   Problem 11.8
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

%% Initialization
f = @(x) exp(3*x).*sin(200.*x.^2)./(1+20.*x.^2);
j = 4:14;
n = 2.^j;
N = length(n);
err = zeros(1,N);
xx = 0:.001:1;
fxx = f(xx);
plot(xx,fxx,'k--')
title('Cubic spline approximations of f(x)')
xlabel('x')
ylabel('spline(x)')
hold on

%% Computing Spline and Error
for i = 1:N
    x = 0:1/n(i):1;
    fx = f(x);
    splinex = spline(x,fx,xx);
    err(i) = max(abs(fxx-splinex));
    plot(xx,splinex)
    hold on
end

figure();
loglog(n,err)
title('Logarithmic graph of errors with respective to mesh size')
xlabel('Mesh size')
ylabel('Error')