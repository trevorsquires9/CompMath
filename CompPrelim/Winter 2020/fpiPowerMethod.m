%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FPIPOWERMETHOD.m
%
% DESCRIPTION
%   Computes the normalized vector in the direction of Ax
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - n x n matrix
%   x - n x 1 vector

%
% OUTPUT
%   gx - normalized version of A*x
%
% NOTES
%   - Used as an input to anderson.m/powerIteration.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [gx] = fpiPowerMethod(A,x)
gx = A*x;
gx = gx/norm(gx);

end

