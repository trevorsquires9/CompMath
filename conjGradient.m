%%%%%%%%%%%%%%%%%%%%%%%%%%%
% shiftedQR.m
%
% DESCRIPTION
%   Solves Ax = b using the conjugate gradient technique.
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - n x n matrix
%   b - n x 1 vector 
%   tol - tolerance for terminating
%
% OUTPUT
%   solu - approximate solution
%   output - structure with various output information in fields
%       x: matrix of iterates
%       err: vector of errors
%       alpha: vector of step lengths
%       beta: vector of improvements
%       residual: matrix of residuals
%       searchDir: matrix of conjugate directions
%
% NOTES
%   - utilizes energy norm for tolerance
%   - not optimized
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [solu, output] = conjGradient(A,b,tol)
n = length(b);
normA = @(x) sqrt(x'*A*x);

x = zeros(n,n+1);
err = zeros(1,n+2);
alpha = zeros(1,n+1);
residual = zeros(n,n+1);
beta = zeros(1,n+1);
searchDir = zeros(n,n+1);

x(:,1) = zeros(n,1);
err(1) = Inf;
residual(:,1) = b;
searchDir(:,1) = b;
i = 2;


while err(i-1) > tol && i <= n+1
    alpha(i) = norm(residual(:,i-1))^2 / normA(searchDir(:,i-1))^2; %step length
    x(:,i) = x(:,i-1) + alpha(i)*searchDir(:,i-1); %approximate solution
    residual(:,i) = residual(:,i-1) - alpha(i)*A*searchDir(:,i-1); %residual
    beta(i) = norm(residual(:,i))^2 / norm(residual(:,i-1))^2; %improvement this step
    searchDir(:,i) = residual(:,i) + beta(i)*searchDir(:,i-1); %search direction
    err(i) = norm(b-A*x(:,i)); %set new error
    i = i+1; %update iterate
end

solu = x(:,end);
output.x = x;
output.err = err;
output.alpha = alpha;
output.beta = beta;
output.residual = residual;
output.searchDir = searchDir;
output.it = i;
