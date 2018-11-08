%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ITERATEANALYSIS.m
%
% DESCRIPTION
%   Ouptut information about the iterates of an algorithm
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   history - vector of sequential iterates
%
%
% NOTES
%   This function prints to the command window its results
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = iterateAnalysis(history)

[m,n] = size(history);
if m<n
    history = history';
end

sameDigit = zeros (n,1);
sameDigit(1) = 0;

for i = 2:n
    sameDigit(i) = countDigitCorrect(history(i),history(i-1));
end

fprintf('Iteration\t\tSolution\t\tCorrect Digits\n')
for i = 1:n
    fprintf('%i\t\t%0.16f\t\t%i\n',i,history(i),sameDigit(i))
end

end