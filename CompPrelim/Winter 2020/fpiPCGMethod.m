function [gx] = fpiPCGMethod(A,x,y,z,c)
if nargin>2
    tol = c*norm(y-z);
else
    tol = 1e-8;
end

L = ichol(A);
mfun = @(u) L'\(L\u);
[gx,~] = pcg(A,x,tol,1000,mfun);


gx = gx/norm(gx);

end

