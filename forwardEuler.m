%%%%%%%%%%%%%%%%%%%%%%%%%%%
% forwardEuler.m
%
% DESCRIPTION
%   Approximates y' using forward euler method
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   f - function handle of RHS
%   y0 - initial solution
%   h - step size
%   int - interval for approximation
%
% OUTPUT
%   y - vector of output
%
% NOTES
%  
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [y] = forwardEuler(f,y0,h,int)
a = int(1);
b = int(2);
t = a:h:b;
y = zeros(length(t),1);
y(1) = y0;

for i = 2:length(t)
    y(i) = y(i-1) + h*f(t(i-1),y(i-1));
end