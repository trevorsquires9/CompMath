function [acc_coeff, acc_L2err, apprx_coeff, apprx_L2err] = testing(l,r)
%L2APPROX approximates the function x^(-1) in the space L^2[1, 2] by a linear
% combination of exp(x), sin(x) and gamma(x).
%
% Z.Y., 7/18/2010.
%
% Reference
% [1] Lloyd Trefethen and David Bau III. Numerical Linear Algebra,
% SIAM, 1997. Exercise 11.2.
%
% Example: L2Approx(1,2);
% Accurate solution: compute coefficients
tol = 1.0e-15;
f11 = @(x)exp(2*x);
f12 = @(x)exp(x).*sin(x);
f13 = @(x)gamma(x).*exp(x);
f22 = @(x)sin(x).*sin(x);
f23 = @(x)gamma(x).*sin(x);
f33 = @(x)gamma(x).*gamma(x);
g1 = @(x)exp(x)./x;
g2 = @(x)sin(x)./x;
g3 = @(x)gamma(x)./x;
accA = zeros(3,3); accb = zeros(3,1);
for i=1:3
accb(i) = eval(['quad(g',num2str(i),', l, r,tol);']);
for j=i:3
accA(i,j) = eval(['quad(f',num2str(i),num2str(j),', l, r,tol);']);
accA(j,i) = accA(i,j);
end
end
acc_coeff = accA\accb;
acc_L2err = quad(@(x)L2Err(x,acc_coeff), l, r, tol);
26
figure(1);
step = 0.001;
x = l:step:r;
y = exp(x)*acc_coeff(1) + sin(x)*acc_coeff(2) + gamma(x)*acc_coeff(3);
z = 1./x;
plot(x, z, 'b', x, y, 'r');
legend('1/x', [num2str(acc_coeff(1)), 'exp(x)+', ...
num2str(acc_coeff(2)), 'sin(x)+', ...
num2str(acc_coeff(3)), 'gamma(x)']);
grid on;
title(['Approximation of 1/x by linear combination of exp(x), sin(x), ',...
'gamma(x) in L2-norm over [', num2str(l),',',num2str(r),']', ...
', L2 err: ', num2str(acc_L2err)]);
% Approximate solution: least square problem
apprx_step = 0.00001;
xx = l:apprx_step:r;
apprxA = [exp(xx)', sin(xx)', gamma(xx)'];
apprxb = 1./xx';
apprx_coeff = apprxA\apprxb;
apprx_L2err = norm(apprxA*apprx_coeff - apprxb, 2)/length(apprxb);
figure(2);
plot(xx, 1./xx, 'b', xx, apprxA*apprx_coeff, 'r');
legend('1/x', [num2str(apprx_coeff(1)), 'exp(x)+', ...
num2str(apprx_coeff(2)), 'sin(x)+', ...
num2str(apprx_coeff(3)), 'gamma(x)']);
grid on;
title(['Approximation of 1/x by linear combination of exp(x), sin(x), ',...
'gamma(x) in discrete L2-norm over [', num2str(l),',',num2str(r),...
'], discrete L2 err: ', num2str(apprx_L2err)]);
end %appox
%%%%%%%%%%%%%%%%%%%%% Nested function %%%%%%%%%%%%%%%%%%%%%
function err = L2Err(x, a)
a1 = a(1); a2 = a(2); a3 = a(3);
err = (a1*exp(x) + a2*sin(x) + a3*gamma(x) - 1./x).^2;
end %L2_err
