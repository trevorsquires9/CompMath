%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue 
%   Homework 2   
%
% Question
%   Problem 3
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
tol = 10e-15;
xstar = [pi 2 exp(1)];
x0 = [3 3 3];

%pre-compute jacobian using f
f = @(x,y,z) [cos(x)*y^2 + x*log(z) - pi + 4; cot(x/4) + y*z^2 - 1-2*exp(2); z*sin(x) + y*log(z) - 2];
myJacobian = @(x,y,z) [-sin(x)*y^2 + log(z), 2*y*cos(x), x/z;(-1/4)*(csc(x/4))^2, z^2, 2*y*z; z*cos(x), log(z), sin(x) + y/z];

%set error to start loop
error = norm(x0-xstar);
iterate = x0;
i = 1;

%% Newton's Update
while error > tol
    x = iterate(i,:);
    fprintf('x_%d = [%e, %e, %e]\t e_%d = %e\n',i-1,x(1),x(2),x(3),i-1,error)
    
    fxk = f(x(1),x(2),x(3)); %compute fxk(x,y,z) 
    jfxk = myJacobian(x(1),x(2),x(3)); % and jfxk(x,y,z)
    update = (jfxk\fxk)'; %solve y = inv(jfxk)*fxk
    iterate(i+1,:) = iterate(i,:)-update; %update xk+1 = xk - update
    i = i+1;
    error = norm(xstar-iterate(i,:)); %refresh error
     
end