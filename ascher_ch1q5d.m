%% Exercise 1.4 Q5D - Computing y20 within an absolute error of 1e-5

clear
clc

n0 =20;
n1 = 25;
y = zeros(1,n1-n0+1);
true_y = zeros(1,n1-n0+1);
abs_err = zeros(1,n1-n0+1);
rel_err = zeros(1,n1-n0+1);

for n = n1:-1:n0+1
    y(n-n0) = 1/(10*n)-y(n-n0+1)/10;
    true_y(n-n0) = integral(@(x) x.^n./(x+10),0,1);
    abs_err(n-n0) = abs(y(n-n0)-true_y(n-n0));
    rel_err(n-n0) = abs_err(n-n0)/abs(true_y(n-n0));
end

output = [(n0:n1)', y', true_y', abs_err', rel_err'];
output(1:n1-n0,:)