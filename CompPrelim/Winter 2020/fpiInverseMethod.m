%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FPIINVERSEMETHOD.m
%
% DESCRIPTION
%   Computes the normalized vector in the direction of A^{-1}x. 
%
% AUTHOR
%   88759
%
% ARGUMENTS
%   A - n x n matrix
%   x - n x 1 vector

%
% OUTPUT
%   gx - normalized version of A\x
%
% NOTES
%   - Used as an input to anderson.m/powerIteration.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [gx] = fpiInverseMethod(A,x)
gx = A\x;
gx = gx/norm(gx);

end

