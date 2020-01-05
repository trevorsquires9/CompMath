%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ANDERSONSUBPROBLEM.m
%
% DESCRIPTION
%   Constructs a function handle for the Anderson acceleration optimization problem to be solved.
%
% AUTHOR
%   88759
%
% ARGUMENTS
%   alpha - argument to the problem
%   x - history of iterates
%   xtilde - history of approximate iterates
%   m - length of history to look back at
%   k - current iteration
%
% OUTPUT
%   output - output of the optimization problem
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [output] = andersonSubProblem(alpha,x,xtilde,m,k)
output = 0;
for i = 1:m
    output = output + alpha(i)*(xtilde(:,k-i+1)-x(:,k-i));
end
output = output + (1-ones(m,1)'*alpha)*(xtilde(:,k-m)-x(:,k-m-1));
output = norm(output);


