%%%%%%%%%%%%%%%%%%%%%%%%%%%
% shiftedQR.m
%
% DESCRIPTION
%   Performs QR decomposition using efficient Wilkinson shifts and
%   deflation. 
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - n x n matrix
%   maxIt - iterations until we stop
%   tol - tolerance for deflation
%
% OUTPUT
%   myEigs - vector of eigenvalues
%   it - total number of iterations (not necessarily on an n x n matrix)
%   executed. Returns empty if executed all maxIt
%
% NOTES
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [myEigs,it] = shiftedQR(A,maxIt,tol)
%% Variable initialization
n = length(A);
H = A;
if n == 1
    myEigs = A;
    it = 0;
    return
end

shifts = zeros(maxIt,1);

%% Loop for eigenvalues
for i = 1:maxIt
    %compute wilkinson shift
    delta = H(n-1,n-1)-H(n,n);
    dSign = sign(delta+eps);
    shifts(i) = H(n,n) - dSign*H(n-1,n)^2/(abs(delta) + sqrt(delta^2 + H(n-1,n))); % for rayleigh quotient shift use H(end,end);
    
    %shifted qr update
    [Q,R] = qr(H-shifts(i)*eye(n));
    Q = Q*diag(sign(diag(R)));
    R = diag(sign(diag(R)))*R;
    H = R*Q + shifts(i)*eye(n);
    
    %possible deflation
    [val,loc] = min(diag(H,-1));
    if val<tol
        A1 = H(1:loc,1:loc);
        A2 = H(loc+1:end,loc+1:end);
        [eig1,it1] = shiftedQR(A1,maxIt-i,tol);
        [eig2,it2] = shiftedQR(A2,maxIt-i-it1,tol);
        myEigs = [eig1,eig2];
        it = it1+it2+i;
        return
    end
end
myEigs = diag(A)';
it = [];
