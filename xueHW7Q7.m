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
%   rombInt.m
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
fprime = @(x) -2*(10*x.^3 + 6*x.^2 + 3*x + 1)./(5*x.^4 + 4*x.^3 + 3*x.^2 + 2*x+1).^2;
a = -1;
b = 1;

real_int = integral(f,a,b);
fprintf('For function 1, \n')
for i = 1:N
    cTrap(i) = compTrap(f,a,b,n(i)) - real_int;
    ccTrap(i) = compTrapCorr(f,fprime,a,b,n(i)) - real_int;
    cSimp(i) = compSimp(f,a,b,n(i)) - real_int;
    cBoole(i) = compBoole(f,a,b,n(i)) - real_int;
end
RombergApprox = rombInt(f,a,b,n(N)) - real_int;

fprintf('The Composite Trapezoid method had an error of\n')
for i = 1:N
    fprintf('\t%e with %d subintervals\n',cTrap(i),n(i))
end
fprintf('The Corrected Composite Trapezoid method had an error of\n')
for i = 1:N
    fprintf('\t%e with %d subintervals\n',ccTrap(i),n(i))
end
fprintf('Simpson''s method had an error of\n')
for i = 1:N
    fprintf('\t%e with %d subintervals\n',cSimp(i),n(i))
end
fprintf('Boole''s method had an error of\n')
for i = 1:N
    fprintf('\t%e with %d subintervals\n',cBoole(i),n(i))
end
fprintf('And Romberg integration with %d subintervals had an error of %e\n\n',n(i),RombergApprox)




%% Second function
f = @(x) sqrt(x);
fprime = @(x) 1/2./sqrt(x);
a = 0;
b = 1;
fprintf('For function 2, \n')
real_int = 2/3;

for i = 1:length(n)
    cTrap(i) = compTrap(f,a,b,n(i)) - real_int;
    ccTrap(i) = compTrapCorr(f,fprime,1e-12,b,n(i)) - real_int;
    cSimp(i) = compSimp(f,a,b,n(i)) - real_int;
    cBoole(i) = compBoole(f,a,b,n(i)) - real_int;
end
RombergApprox = rombInt(f,a,b,n(N)) - real_int;

fprintf('The Composite Trapezoid method had an error of\n')
for i = 1:N
    fprintf('\t%e with %d subintervals\n',cTrap(i),n(i))
end
fprintf('The Corrected Composite Trapezoid method had an error of\n')
for i = 1:N
    fprintf('\t%e with %d subintervals\n',ccTrap(i),n(i))
end
fprintf('Simpson''s method had an error of\n')
for i = 1:N
    fprintf('\t%e with %d subintervals\n',cSimp(i),n(i))
end
fprintf('Boole''s method had an error of\n')
for i = 1:N
    fprintf('\t%e with %d subintervals\n',cBoole(i),n(i))
end
fprintf('And Romberg integration with %d subintervals had an error of %e\n\n',n(i),RombergApprox)

%% Third function
f = @(x) 1/2/pi * sqrt(1-0.36*sin(x).^2);
fprime = @(x) 1/2/pi * -0.36*sin(x).*cos(x)./ sqrt(1-0.36*sin(x).^2);
a = 0;
b = 2*pi;
fprintf('For function 3, \n')
real_int = 0.9027799277721939;

for i = 1:length(n)
    cTrap(i) = compTrap(f,a,b,n(i)) - real_int;
    ccTrap(i) = compTrapCorr(f,fprime,a,b,n(i)) - real_int;
    cSimp(i) = compSimp(f,a,b,n(i)) - real_int;
    cBoole(i) = compBoole(f,a,b,n(i)) - real_int;
end
RombergApprox = rombInt(f,a,b,n(N)) - real_int;

fprintf('The Composite Trapezoid method had an error of\n')
for i = 1:N
    fprintf('\t%e with %d subintervals\n',cTrap(i),n(i))
end
fprintf('The Corrected Composite Trapezoid method had an error of\n')
for i = 1:N
    fprintf('\t%e with %d subintervals\n',ccTrap(i),n(i))
end
fprintf('Simpson''s method had an error of\n')
for i = 1:N
    fprintf('\t%e with %d subintervals\n',cSimp(i),n(i))
end
fprintf('Boole''s method had an error of\n')
for i = 1:N
    fprintf('\t%e with %d subintervals\n',cBoole(i),n(i))
end
fprintf('And Romberg integration with %d subintervals had an error of %e\n\n',n(i),RombergApprox)
