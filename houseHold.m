%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HOUSEHOLD.m
%
% DESCRIPTION
%   Help
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - m x m  matrix
%
% OUTPUT
%   Help
%
% NOTES
%   No bugs, but we don't understand what's going on
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [A,p] = houseHold(A)

[m,n] = size(A);
p = zeros(1,n);

for k = 1:n
    z = A(k:m,k);
    el = [1;zeros(m-k,1)];
    u = z+sign(z(1))*norm(z)*el;
    u = u/norm(u);
    A(k:m,k:n) = A(k:m,k:n)-2*u*(u'*A(k:m,k:n));
    
    p(k) = u(1);
    A(k+1:m,k) = u(2:m-k+1);
end

end



