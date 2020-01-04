%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ANDERSON.m
%
% DESCRIPTION
%   Uses the power method with Anderson acceleration to compute the closest eigenpair to alpha of a matrix A
%
% AUTHOR
%   Trevor Squires
%
% ARGUMENTS
%   A - n x n matrix
%   v0 - 1 x n vector of initial guess for eigenvector
%   tol - tolerance for quitting
%
% OUTPUT
%   lambda - eigenvalue approximation vector
%   v - closest eigenvector to alpha's eigenvector
%
% NOTES
%   Fixes the size of the vector if transposed, errors if not right size.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [x,w,theta] = anderson(A,v0,g,tol,m,maxIt)
%% Initialization
n = length(v0);

w = zeros(n, maxIt);
theta = zeros(1,maxIt);
x = zeros(n,maxIt);
xtilde = zeros(n,maxIt);
xtilde(:,2:m+1) = repmat(g(v0),1,m);
x(:,1:m) = repmat(v0,1,m);
x(:,m+1) = xtilde(:,m+1);

%% Anderson Iterations
for i = 3+m-1:maxIt
    xtilde(:,i) = g(x(:,i-1));
    alphaFunc = @(z) andersonSubProblem(z,x,xtilde,m,i);
    
    options = optimoptions('fmincon','Display','off');
    [alpha,fVal] = fmincon(alphaFunc,ones(m,1),[],[],[],[],[],[],[],options);
    
    theta(i) = fVal/norm(xtilde(:,i)-x(:,i-1));
    if theta(i)>1 %numerical difficulties using fmincon
        theta(i) = 1;
        alpha = eye(m,1);
    end
    for j = 0:m-1
        x(:,i) = x(:,i)+alpha(j+1)*xtilde(:,i-j);
    end
    x(:,i) = x(:,i) + (1-alpha'*ones(m,1))*xtilde(:,i-m);
        
    
    w(:,i) = xtilde(:,i) - x(:,i-1);
    error = norm(A*x(:,i)- ((x(:,i)'*A*x(:,i))/(x(:,i)'*(x(:,i))))*x(:,i));
    
    
    if error<tol
        break;
    end
end


%% Postprocessing
count = nnz(vecnorm(x));
x = x(:,1:count);
w = w(:,1:count);
theta = theta(1:count);
