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
    ls = zeros(1,checkPts);
    
    for i = 1:checkPts
        ls(i) = lagrangeEval1(x,y,mu,s{j}(i));
    end
    err(j) = norm(fs-ls);
end

%% Part b
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
        ls(i) = lagrangeEval2(x,y,mu,s{j}(i));
    end
    err(j) = norm(fs-ls);
end

%% Part c
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
    toc
end

fprintf('\nType 1 Evaluation\n')
for k = 1:length(n)
    x = chebyshevPoints(a,b,n(k));
    y = f(x);
    tic
    mu = chebyshevWeights(n(k)+1);
    baryEval1(x,y,mu,s);
    toc
end

fprintf('\nClassical Evaluation\n')
for k = 1:1
    x = chebyshevPoints(a,b,n(k));
    y = f(x);
    tic
    lagrangeEval(x,y,s);
    toc
end
