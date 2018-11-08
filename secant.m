%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECANT.m
%
% DESCRIPTION
%   Finds root of a given function using the secant method
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   f - function handle
%   x0 - initial starting point
%   x1 - second starting point
%   tol - tolerance for quiting
%
% OUTPUT
%   history - vector of previous iterates
%
% NOTES
%   Uses change in iterates as stopping criterion
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [history] = secant(f,x0,x1,tol)

error = tol+1;
count = 2;
history = [x0 x1];

while error > tol
    history(count+1) = history(count) - f(history(count))*(history(count)- history(count-1))/(f(history(count))-f( history(count-1)));
    count = count +1;
    error = abs(history(count)-history(count-1));
end
