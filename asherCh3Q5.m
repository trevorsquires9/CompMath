%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue 
%   Homework 2   
%
% Question
%   3.5
%
% Function Dependencies
%   fixedPoint.m
%
% Notes
%   Uses the fixedPoint function to do Newton's Method. 
%
% Author
%   Trevor Squires
%%%%%%%%%%%%%%%%%%%%%%%%%%%

a = [0,2,10];
n = length(a);
solu = zeros(1,n);
epsilon = rand()+1;

for i = 1:length(a)
    f = @(x) x.^3-a(i);
    g = @(x) x - (x.^3-a(i))/(3*x.^2);
    iterates = fixedPoint(f,g,epsilon+a(i)/2,1e-8);
    fprintf('\n\nFor a = %d\n',a(i))
    for j=1:length(iterates)
        fprintf('x_%d = %e\tf(x_%d) = %e\n',j-1,iterates(j),j-1,f(iterates(j)))
    end
    solu(i) = iterates(end);
end