%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue 
%   Homework 3   
%
% Question
%   Problem 6
%
% Function Dependencies
%   cholDecomp.m
%   
%
% Notes
%   The purpose of the question is unclear to me
%
% Author
%   Trevor Squires
%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc

A = delsq(numgrid('S',5));
L = cholDecomp(A);
disp(L)