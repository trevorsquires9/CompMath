%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CHEBYSHEVWEIGHTS.m
%
% DESCRIPTION
%   Computes Chebyshev weights used in type 2 formula
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   n - number of data points
% OUTPUT
%   mu - vector of weights
%
% NOTES
%   Beautiful
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [mu] = chebyshevWeights(n)

mu = ones(1,n);
mu(2:2:n) = -1*ones(1,floor(n/2));

mu(1) = 1/2;
mu(n) = 1/2*mu(n);

end