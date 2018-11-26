%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue
%   Homework 7
%
% Question
%   Problem 5b
%
% Function Dependencies
%   compTrap.m
%   compTrapCorr.m
%   compSimp.m
%   compBoole.m
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

exponents = 5:9;
n = 2.^exponents;
N = length(n);

cTrap = zeros(1,N);
ccTrap = zeros(1,N);
cSimp = zeros(1,N);
cBoole = zeros(1,N);


%% First function
f = @(x) 1./(5*x.^4 + 4*x.^3 + 3*x.^2 + 2*x + 1);
a = -1;
b = 1;

real_int = integral(f,a,b);

for i = 1:length(n)
    cTrap(i) = compTrap(f,a,b,n(i)) - real_int;
    %ccTrap(i) = compTrapCorr(f,a,b,n(i)) - real_int;
    cSimp(i) = compSimp(f,a,b,n(i)) - real_int;
    cBoole(i) = compBoole(f,a,b,n(i)) - real_int;
end


%% Second function
f = @(x) sqrt(x);
a = 0;
b = 1;

real_int = 2/3;

for i = 1:length(n)
    cTrap(i) = compTrap(f,a,b,n(i)) - real_int;
    %ccTrap(i) = compTrapCorr(f,a,b,n(i)) - real_int;
    cSimp(i) = compSimp(f,a,b,n(i)) - real_int;
    cBoole(i) = compBoole(f,a,b,n(i)) - real_int;
end

%% Third function
f = @(x) 1/2/pi * sqrt(1-0.36*sin(x).^2);
a = 0;
b = 2*pi;

real_int = 0.9027799277721939;

for i = 1:length(n)
    cTrap(i) = compTrap(f,a,b,n(i)) - real_int;
    %ccTrap(i) = compTrapCorr(f,a,b,n(i)) - real_int;
    cSimp(i) = compSimp(f,a,b,n(i)) - real_int;
    cBoole(i) = compBoole(f,a,b,n(i)) - real_int;
end