%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIXEDPOINT.m
%
% DESCRIPTION
%   Finds fixed point of a given function using the fixed point method
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   f - function handle
%   x0 - initial starting point
%   tol - tolerance for quiting
%
% OUTPUT
%   history - vector of previous iterates
%
% NOTES
%   The function f must satisfy the fixed point theorem requirements
%   Can choose to change stopping criterion by choosing how to compute the
%   error
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [history] = fixedPoint(f,g,x0,tol)
error = tol+1;
history = x0;
count = 1;

while error>tol   
    history(count+1) = g(history(count)); %add to history
    %error = abs(history(count+1)-history(count));
    error = abs(f(history(count+1)));  %update error
    count = count + 1;
end

