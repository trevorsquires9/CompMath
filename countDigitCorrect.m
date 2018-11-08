%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COUNTDIGITCORRECT.m
%
% DESCRIPTION
%   Finds the amount of matching opening digits between two numbers
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   x - first number to compare
%   y - second number to compare
%
% OUTPUT
%   zeroes - number of consecutive matching digits
%
% NOTES
%   Uses change in iterates as stopping criterion
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [zeroes] = countDigitCorrect(x,y)

x = (x-floor(x));
y = (y-floor(y));

diff = abs(x-y); 
if diff == 0
    zeroes = 16;
    return
end

zeroes = floor(abs(log10(diff)));

if floor(diff*10^(zeroes+1)) == 9
    zeroes = zeroes - 1;
end

end