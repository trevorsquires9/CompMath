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
f = @(x) 1./x;

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

subplot(1,2,1);
plot(t,ft,'r-') 
hold on
plot(t,gt,'b--')
legend ('f(t)','g(t)')
title('Projection Approach')



%% Alternative Approach through least squares solve
clear

syms x
g{1} = exp(x);
g{2} = gamma(x);
g{3} = sin(x);
f = @(x) 1./x;

AtA = zeros(3);
AtB = zeros(3,1);
for i = 1:3
    for j = 1:3
        AtA(i,j) = vpa(int(g{i}*g{j},[1,2]));
    end
    AtB(i) = vpa(int(g{i}*f,[1,2]));
end

c = AtA\AtB;
t = linspace(1,2,100);
p = @(x) exp(x)*c(1) + gamma(x)*c(2) + sin(x)*c(3);

subplot(1,2,2);
plot(t,feval(f,t),'r-')
hold on
plot(t,feval(p,t),'b--')
legend ('f(t)','g(t)')
title('LSQ Approach')



%% Not working approach
% clear
% clc
% close all;
% 
% f = @(x) 1./x;
% t = linspace(1,2,200);
% 
% ft = f(t)';
% A = [sin(t)' exp(t)' gamma(t)'];
% 
% x = A\ft;
% p = @(x) x(1)*sin(x) + x(2)*exp(x) + x(3)*gamma(x);
% pt = p(t);
% 
% plot(t,ft,'r-')
% hold on
% plot(t,pt,'b--')
% 
