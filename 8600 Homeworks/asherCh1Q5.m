%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue 
%   Homework 1   
%
% Question
%   1.5
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

n0 =20;
n1 = 24;
y = zeros(1,n1-n0+1);
true_y = zeros(1,n1-n0+1);
abs_err = zeros(1,n1-n0+1);
rel_err = zeros(1,n1-n0+1);

for n = n1:-1:n0+1
    y(n-n0) = 1/(10*n)-y(n-n0+1)/10;
    true_y(n-n0) = integral(@(x) x.^(n-1)./(x+10),0,1);
    abs_err(n-n0) = abs(y(n-n0)-true_y(n-n0));
    rel_err(n-n0) = abs_err(n-n0)/abs(true_y(n-n0));
end

output = [(n0:n1)', y', true_y', abs_err', rel_err'];

fprintf('True y_%d = %0.10f\nComputed y_%d = %0.10f\nAbsolute Error = %e\n',n0,true_y(1),n0,y(1),abs_err(1))
