%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spring 2018 Math 8610 w/ Xue 
%   Homework 1   
%
% Problem
%   4
%
% Function Dependencies
%   cramersRule.m
%   matSolve.m
%   pluFact.m
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

n = [9,19,29,39];
forErrMat = zeros(1,length(n));
backErrMat = zeros(1,length(n));

forErrQR = zeros(1,length(n));
backErrQR = zeros(1,length(n));

forErrCramer = zeros(1,length(n));
backErrCramer = zeros(1,length(n));

forErrAinv = zeros(1,length(n));
backErrAinv = zeros(1,length(n));

forErrGE = zeros(1,length(n));
backErrGE = zeros(1,length(n));

for j = 1:length(n)
x = linspace(-1,1,n(j)+1)';
xtrue = ones(n(j)+1,1);
A = vander(x);
normA = norm(A);
b = A*xtrue;


%Matlab's backslash
xhat = A\b;
forErrMat(j) = norm(xhat-xtrue)/norm(xtrue);
backErrMat(j) = norm(b-A*xhat)/normA/norm(xhat);

%QR Factorization
[Q,R] = qr(A);
newb = Q'*b;
xhat = R\newb;
forErrQR(j) = norm(xhat-xtrue)/norm(xtrue);
backErrQR(j) = norm(b-A*xhat)/normA/norm(xhat);

%Cramer's Rule
xhat = cramersRule(A,b);
forErrCramer(j) = norm(xhat-xtrue)/norm(xtrue);
backErrCramer(j) = norm(b-A*xhat)/normA/norm(xhat);

%A inverse b
xhat = inv(A)*b;
forErrAinv(j) = norm(xhat-xtrue)/norm(xtrue);
backErrAinv(j) = norm(b-A*xhat)/normA/norm(xhat);

%Gaussian Elimination without Pivoting
xhat = matSolve(A,b);
forErrGE(j) = norm(xhat-xtrue)/norm(xtrue);
backErrGE(j) = norm(b-A*xhat)/normA/norm(xhat);

end

plot(n,log10(forErrGE),'g--')
hold on
plot(n,log10(forErrAinv),'r-.')
hold on
plot(n,log10(forErrMat),'b:')
hold on
plot(n,log10(forErrQR),'k-')

title('Semilogy Plot of Forward Errors')
xlabel('n')
ylabel('Log(Forward Error)')
legend('GE', 'inv(A)b','GEPP','QR','location','best')


figure()
plot(n,log10(backErrGE),'g--')
hold on
plot(n,log10(backErrAinv),'r-.')
hold on
plot(n,log10(backErrMat),'b:')
hold on
plot(n,log10(backErrQR),'k-')

title('Semilogy Plot of Backward Errors')
xlabel('n')
ylabel('Log(Backward Error)')
legend('GE', 'inv(A)b','GEPP','QR','location','best')
