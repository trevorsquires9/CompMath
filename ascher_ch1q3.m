%% Exercise 1.4 Q3 - Approximating f'(x_0) with f(x) = sin(x) at x_0 = 1.2
%using the f(x+h)-f(x-h) approximation

clear
clc

trials = 8;
start = 2;

it = start:trials+start;
h = 10.^-it;
f = @(x) sin(x);
x0 = 1.2;
f_true = cos(x0);

f_approx = zeros(1,trials);
rel_error = zeros(1,trials);
abs_error = zeros(1,trials);

for i=1:trials+1
    f_approx(i) = (f(x0 + h(i)) - f(x0 - h(i)))/2/h(i);
    abs_error(i) = abs(f_true - f_approx(i));
    rel_error(i) = abs_error(i)/abs(f_true);
end

output = [h', f_approx', abs_error', rel_error'];

loglog(h,abs_error,'b-.')
hold on
loglog(h,rel_error,'r--')
xlabel('h')
ylabel('Error')
legend('Absolute','Relative')
title('Error Domination')

