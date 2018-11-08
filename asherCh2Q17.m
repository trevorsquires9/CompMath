%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue 
%   Homework 1   
%
% Question
%   2.17
%
% Notes
%   None
%
% Author
%   Trevor Squires
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Problem 2.17
clear
clc
close all;

regSum = 0;
for i = 1:10000
    regSum = regSum + 1/i;
end

roundSum = 0;
for i = 1:10000
    tmp = round(1/i,5,'significant');
    roundSum = round(roundSum+tmp,5,'significant');
end

backSum = 0;
for i = 10000:-1:1
    tmp = round(1/i,5,'significant');
    backSum = round(backSum+tmp,5,'significant');
end

fprintf('Forward full precision sum: %0.5f\nForward 5 digit precision sum: %0.5f\nBackward 5 digit precision sum:%0.5f\n',regSum,roundSum,backSum)

