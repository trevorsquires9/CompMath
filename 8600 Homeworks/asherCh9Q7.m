%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue
%   Homework 2
%
% Question
%   9.7
%
% Function Dependencies
%   None
%
% Notes
%   Uses precomputed Jacobian to do Newton's method.
%
% Author
%   Trevor Squires
%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all;

%% Initialize necessary variables
tol = 10e-10;
n = [8,16,32,64];
y0 = 0;
yEnd = log(2);

for j = 1:length(n)
    h = 1/(n(j)+1);
    t = 1:h:2;
    solu = log(t(2:n(j)+1));
    startY = rand(1,n(j));
    error = norm(startY,2);
    iterate = startY;
    i = 1;
    fprintf('\nFor n=%d\n',n(j))
    while error > tol
        y = iterate(i,:);
        [jfxk, fxk] = functionEval(y,y0,yEnd,h);
        update = (jfxk\fxk'); %solve y = inv(jfxk)*fxk
        iterate(i+1,:) = iterate(i,:)-update'; %update xk+1 = xk - update
        i = i+1;
        error = norm(fxk); %refresh error
        fprintf('At step %d, the norm of F(x_k) is %e\n',i-1,error)
    end
    fprintf('But the error between our computed solution and ln(x) is %e\n',norm(iterate(i,:)-solu,2))
end

%% Evaluation function
function [myJac,fy] = functionEval(y,y0,yEnd,h)

n = length(y);
y = [y0 y yEnd];

%% Evaluate our F at x
fy = zeros(1,n);
for i = 2:n+1
    fy(i-1) = (y(i+1) - 2*y(i) + y(i-1))/h^2 + ((y(i+1) - y(i-1))/(2*h))^2 + y(i) - log(1+(i-1)*h);
end

%% Evaluate Jf at x
myJac = zeros(n);
diags = zeros(1,n-1);

for i = 1:n
    diags(i) = (y(i+2)-y(i))/2/h^2;
end

myJac = myJac + diag(ones(1,n)*(1-2/(h^2)));
myJac = myJac + diag((1/h^2)+diags(1:end-1),1) + diag((1/h^2)-diags(2:end),-1);

end

