%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ANDERSONQ6.m
%
% DESCRIPTION
%   Uses Anderson acceleration to accelerate the performance of
%   power/inverse method. The only difference between this code and
%   anderson.m is this code sends additional parameters to the input
%   function g()
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - n x n matrix
%   v0 - n x 1 vector of initial guess for eigenvector
%   g - function used to generate the next point.  For power method, try
%       g(x) = A*x/||A*x||, and for inverse method, try g(x) = (A\x)/(||A\x||)
%   tol - tolerance for quitting
%   m - number of iterate history to look back on
%   maxIt - maximum number of iterations before quitting
%
% OUTPUT
%   x - matrix of eigenvector approximations
%   w - matrix of fixed point iteration error vectors
%   theta - vector of gains via Anderson acceleration
%
% NOTES
%   - Saves on computing Ax by storing the matrix-vector product after the
%   first computation
%   - Poorly computes the solution to the Anderson acceleration
%   optimization problem. Since fminsearch calls a specified function
%   multiple times, it takes a long amount of time to complete. This could
%   be improved by writing a specialized optimizer for the subproblem, but
%   is not done here. The convergence results are still the same, but the
%   time to run may be longer than necessary. 
%   - MATLAB's fminsearch may not always find the optimal solution (it may
%   converge prematurely).  As such, sometimes the gain is slightly greater
%   than 1 (usually 1.005 or something). To alleviate this, whenever the
%   gain is greater than 1, this code manually forces alpha = (1,0,...,0)^T
%   - To allow the m-level Anderson subproblem to work on the first
%   iteration, the first m vectors are initialized to v0.  This does not
%   affect the optimization problem, and allows for more elegant code. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%




function [x,w,theta] = andersonQ6(A,v0,g,tol,m,maxIt)
%% Initialization
n = length(v0);

w = zeros(n, maxIt);
theta = zeros(1,maxIt);
x = zeros(n,maxIt);
xtilde = zeros(n,maxIt);
xtilde(:,2:m+1) = repmat(g(v0,1e-8,0),1,m);
x(:,1:m) = repmat(v0,1,m);
x(:,m+1) = xtilde(:,m+1);

%% Anderson Iterations
for i = 3+m-1:maxIt
    xtilde(:,i) = g(x(:,i-1),xtilde(:,i-1),x(:,i-2));
    alphaFunc = @(z) andersonSubProblem(z,x,xtilde,m,i);
    [alpha,fVal] = fminsearch(alphaFunc,ones(m,1));
    theta(i) = fVal/norm(xtilde(:,i)-x(:,i-1));
    if theta(i)>1 %numerical difficulties using fmincon
        theta(i) = 1;
    end
    for j = 0:m-1
        x(:,i) = x(:,i)+alpha(j+1)*xtilde(:,i-j);
    end
    x(:,i) = x(:,i) + (1-alpha'*ones(m,1))*xtilde(:,i-m);
    w(:,i) = xtilde(:,i) - x(:,i-1);
    
    tmp = A*x(:,i);
    error = norm(tmp- x(:,i)'*tmp/(x(:,i)'*(x(:,i)))*x(:,i));
    
    
    if error<tol
        break;
    end
end


%% Postprocessing
count = nnz(vecnorm(x));
x = x(:,1:count);
w = w(:,1:count);
theta = theta(1:count);
