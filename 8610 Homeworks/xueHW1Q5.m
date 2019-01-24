%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spring 2018 Math 8610 w/ Xue
%   Homework 1
%
% Problem
%   5
%
% Function Dependencies
%   None
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
tic
exp = 5:8;
n = 2.^exp;
k = length(n);
trials = 5000;
counts = zeros(1,k);

for j = 1:k
    counts(j) = 0;
    for i = 1:trials
        A = randn(n(j),n(j))/sqrt(n(j));
        [~,~,growth] = pluFact(A,'pivot');
        if growth > sqrt(n(j))
            counts(j) = counts(j) + 1;
        end
    end
end
toc 