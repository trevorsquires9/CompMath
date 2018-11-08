function [b] = hornerDeflate(a,z)

m = length(a); % order + one: N+1
b = zeros(1,m-1);
b(1) = a(1); % initial condition
for k = 1:m-2 % iterative Horner’s algorithm
    b(k+1) = z*b(k) + a(k+1); % recursive deflation of f(z)
end

end