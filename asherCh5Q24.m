%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue
%   Homework 4
%
% Question
%   Problem 5.24
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

t = 0:.01:10;
m = length(t);
x(1,1:m) = sin(t);
x(2,1:m) = cos(t);
plot(x(1,:),x(2,:),'r-','DisplayName','Unchanged')
xlabel('x_1')
ylabel('x_2')
hold on

d = [-.75, -.25, .95];
linS = {'--',':','-.'};
for i = 1:length(d)
    A = [1, d(i); d(i),1];
    y = A*x;
    plot(y(1,:),y(2,:),'linestyle',linS{i},'DisplayName',sprintf('d=%0.2f',d(i)))
    hold on

    
end
legend