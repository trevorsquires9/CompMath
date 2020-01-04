function [gx] = fpiInverseMethod(A,x)
gx = A\x;
gx = gx/norm(gx);

end

