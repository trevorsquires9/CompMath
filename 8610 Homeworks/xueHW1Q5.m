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

n = 2.^exp;
k = length(n);
trials = 5;
counts = zeros(1,k);
saveFreq = 100;

for i = 1:trials
    for j = 1:k
        A = randn(n(j),n(j))/sqrt(n(j));
        [~,~,growth] = pluFact(A,'pivot');
        if growth > sqrt(n(j))
            counts(j) = counts(j) + 1;
        end
    end
    if mod(i,saveFreq) == 0
	save('results')
    end
end
time = toc;

save('results')
