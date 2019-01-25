%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spring 2018 Math 8610 w/ Xue 
%   Homework 1   
%
% Problem
%   3
%
% Function Dependencies
%   None
%
% Notes
%   None
%
% Author
%   Trevor Squires
%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all;

load 'wilk24mc.mat'

%Part a

int = 16:20;
xk = int;
ak = wCoeff(25-int)';
wPrime = polyder(wCoeff)';

dpxk = polyval(wPrime,int);


conditioning = xk.^(int-1).*ak./dpxk;

[val,loc] = max(abs(conditioning));

fprintf('The %d-th root is most sensitive to perturbations in the %d-th coefficient with a relative condition number %e\n',loc+int(1)-1,loc+int(1)-1,val)

%Part b
compRoots = roots(wCoeff);
compRoots = sort(compRoots);
err = (1:24)'-compRoots;
relErr = err./(1:24)';

for i = 1:length(relErr)
    relErr(i) = norm(relErr(i));
end

plot(1:24,relErr,'*k')
title('Relative Error of Roots')
ylabel('Relative Error')
xlabel('Root')
