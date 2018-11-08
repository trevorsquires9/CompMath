%Cubic spline test

clear
clc
close all;

startpoint = -3;
endpoint = 3;
step = 0.05;
evalPoints = 100;

f = @(x) sin(4.*x) - cos(3*x) + 4;

% x_data = [0,3,5,6.5,7,10];
test_data = startpoint:step:endpoint;
x_data = startpoint:(endpoint-startpoint)/(evalPoints-1):endpoint;

y_data = f(x_data);
y_real = f(test_data);

[a,b,c,d] = cubicSpline(x_data,y_data);

%%
y_approx = zeros(1,length(test_data));

for i = 1:length(test_data)
    y_approx(i) = cubicSplineEval(a,b,c,d,x_data,test_data(i));
end

%%
plot(test_data,y_real,test_data,y_approx)

[abs_err,loc] = max(abs(y_approx-y_real));
rel_err = abs_err/abs(y_real(loc));