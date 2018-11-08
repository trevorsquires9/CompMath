%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue 
%   Homework 1   
%
% Question
%   1.4
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

plots = 2;
n = 2*plots+1;
exponents = -plots:plots;
c = 10.^(exponents);
tanh = @(c,x) (exp(c*x)-exp(-c*x))/(exp(c*x) + exp(-c*x));

x = -1:0.01:1;
numPts = length(x);

y = zeros(n, numPts);

for i = 1:n
    for j = 1:numPts
        y(i,j) = tanh(c(i),x(j));
    end
end

legendNames = cell(1,n);
for i = 1:n
    legendNames{i} = sprintf('c = %0.1e',c(i));
    plot(x,y(i,:))
    hold on
    
end
legend(legendNames, 'Location','Best')
title('Plotting tanh(cx) for variable c')







