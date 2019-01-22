%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue 
%   Homework 1   
%
% Question
%   2.14
%
% Notes
%   Copied directly from book with minor changes
%
% Author
%   Trevor Squires
%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all;

x0 = 1.2;
f0 = sin(x0);
fp = cos(x0);
i = -20:0.5:0;
h = 10.^i;
err = abs(fp-(sin(x0+h)-sin(x0-h))/2./h);
d_err = f0/2*h;
figure();
loglog(h,err,'r--');
hold on
xlabel('h')
ylabel('Absolute error');
title('Truncation vs. Roundoff Errors')
