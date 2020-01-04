function [gx] = fpiPowerMethod(A,x)
gx = A*x;
gx = gx/norm(gx);

end

