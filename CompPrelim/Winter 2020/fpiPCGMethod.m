%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FPIPCGMETHOD.m
%
% DESCRIPTION
%   Uses pcg applied to y=Ax with an incomplete Cholesky preconditioner to
%   compute a normalized vector in the direction of A^{-1}x
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - n x n matrix
%   x - n x 1 vector
%   y - optional parameter used for relative tolerance
%   z - optional parameter used for relative tolerance
%   c - optional parameter that serves as a scaling factor on the relative
%   tolerance

%
% OUTPUT
%   gx - normalized version of A\x
%
% NOTES
%   - Used as an input to anderson.m/powerIteration.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [gx] = fpiPCGMethod(A,x,y,z,c)
if nargin>2 %if optional parameters are present
    tol = c*norm(y-z);
else %otherwise use fixed tolerance
    tol = 1e-8;
end

L = ichol(A);
mfun = @(u) L'\(L\u);
[gx,~] = pcg(A,x,tol,1000,mfun); %solve preconditioned system


gx = gx/norm(gx);

end

