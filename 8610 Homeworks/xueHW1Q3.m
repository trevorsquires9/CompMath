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
ak = wCoeff(int+1)';
dpxk = zeros(1,int(end)-int(1)+1);

for i = int
    myRoots = 1:24;
    tmp = myRoots-i;
    tmp(i) = 1;
    dpxk(i-int(1)+1) = prod(tmp);
end

conditioning = xk.^(int-1).*ak./dpxk;

[val,loc] = max(abs(conditioning));

fprintf('The %d-th root is most sensitive to perturbations in the %d-th coefficient with a relative condition number %e\n',loc+int(1)-1,loc+int(1)-1,val)

%Part b
compRoots = roots(wCoeff);
compRoots = sort(compRoots);
err = (1:24)'-compRoots;

wCoeff(20) = wCoeff(20)*(1+1e-7);
compRoots = roots(wCoeff);
compRoots = sort(compRoots);
newErr = (1:24)'-compRoots;
