%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue
%   Homework 6
%
% Problem
%   8
%
% Function Dependencies
%   baryWeights.m
%   chebyshevPoints.m
%   chebyshevWeights.m
%   baryEval2.m
%   baryEval1.m
%   lagrangeEval.m
%
% Notes
%
% Author
%   Trevor Squires
%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all;

f = @(x) exp(-5*x).*sin(1./x).*sin(1./(sin(1./x)));
a = 0.17;
b = 0.31;

%% Part a
fprintf('Part a\n')
n = 120;
x = linspace(a,b,n+1);
y = f(x);
mu = baryWeights(x);

checkPts = 2^10;
s{1} = rand(1,checkPts)/10+0.19;
s{2} = rand(1,checkPts)/10+0.185;
s{3} = rand(1,checkPts)*0.14+0.17;
err = zeros(1,3);


for j = 1:3
    fs = f(s{j});
    ls = baryEval1(x,y,mu,s{j});
    err(j) = norm(fs-ls);
    fprintf('The norm of the error in interval %d is %e\n',j,err(j))
end

%% Part b
fprintf('\nPart b\n')
x = chebyshevPoints(a,b,n);
y = f(x);
mu = chebyshevWeights(n+1);

checkPts = 2^10;
s{1} = rand(1,checkPts)/10+0.19;
s{2} = rand(1,checkPts)/10+0.185;
s{3} = rand(1,checkPts)*0.14+0.17;
err = zeros(1,3);

for j = 1:3
    fs = f(s{j});
    ls = zeros(1,checkPts);
    
    for i = 1:checkPts
        ls(i) = baryEval2(x,y,mu,s{j}(i));
    end
    err(j) = norm(fs-ls);
    fprintf('The norm of the error in interval %d is %e\n',j,err(j))
end

%% Part c
fprintf('\nPart c\n')
a = 0.1596;
b = 0.3175;

checkPts = 2^14;
n = [600,800,900,1000,1100];

for k = 1:length(n)
    x = chebyshevPoints(a,b,n(k));
    y = f(x);
    mu = chebyshevWeights(n(k)+1);
    
    s = rand(1,checkPts)*(b-a) + a;
    fs = f(s);
    ls = baryEval2(x,y,mu,s);
    err(k) = norm(fs-ls);
    fprintf('The norm of the error with n = %d is %e\n',n(k),err(k))
end


%% Part d
s = rand(1,checkPts)*(b-a)+a;

fprintf('Type 2 Evaluation\n')
for k = 1:length(n)
    x = chebyshevPoints(a,b,n(k));
    y = f(x);
    tic
    mu = chebyshevWeights(n(k)+1);
    baryEval2(x,y,mu,s);
    time = toc;
    fprintf('Elapsed time is %0.6f seconds for n = %d.\n',time,n(k))
end

fprintf('\nType 1 Evaluation\n')
for k = 1:length(n)
    x = chebyshevPoints(a,b,n(k));
    y = f(x);
    tic
    mu = baryWeights(x);
    baryEval1(x,y,mu,s);
    time = toc;
    fprintf('Elapsed time is %0.6f seconds for n = %d.\n',time,n(k))
end

fprintf('\nClassical Evaluation\n')
for k = 1:1
    x = chebyshevPoints(a,b,n(k));
    y = f(x);
    tic
    lagrangeEval(x,y,s);
    time = toc;
    fprintf('Elapsed time is %0.6f seconds for n = %d.\n',time,n(k))
end
