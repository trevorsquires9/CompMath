%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BARYWEIGHTS.m
%
% DESCRIPTION
%   Computes barycentric weights using type 1 formula
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   x - vector of abscissa points
%
% OUTPUT
%   mu - vector of weights
%
% NOTES
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [mu] = baryWeights(x)

n = length(x);
mu = ones(1,n);

for i = 1:n
    for j = 1:n
        if j ~= i
            mu(i) = mu(i)*(x(i)-x(j));
        end
    end
    mu(i) = 1/mu(i);
end
