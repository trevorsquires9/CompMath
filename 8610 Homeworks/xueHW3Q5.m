%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spring 2018 Math 8610 w/ Xue 
%   Homework 3   
%
% Problem
%   5
%
% Function Dependencies
%   HW3_GKLsvds.m
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
load picA

%% A
rk = 320; 
tic; [Us1,Ss1,Vs1] = HW3_GKLsvds(pic_A(:,:,1),rk); toc;
tic; [Us2,Ss2,Vs2] = HW3_GKLsvds(pic_A(:,:,2),rk); toc;
tic; [Us3,Ss3,Vs3] = HW3_GKLsvds(pic_A(:,:,3),rk); toc;
tic; [U1,S1,V1] = svd(pic_A(:,:,1),0); toc;
tic; [U2,S2,V2] = svd(pic_A(:,:,2),0); toc;
tic; [U3,S3,V3] = svd(pic_A(:,:,3),0); toc;

%% B
Ahat = zeros(size(pic_A));
Ahat(:,:,1) = Us1*Ss1*Vs1';
Ahat(:,:,2) = Us2*Ss2*Vs2';
Ahat(:,:,3) = Us3*Ss3*Vs3';

disp([norm(Ahat(:,:,1)-pic_A(:,:,1),'fro')/norm(pic_A(:,:,1),'fro') ...
    norm(Ahat(:,:,2)-pic_A(:,:,2),'fro')/norm(pic_A(:,:,2),'fro') ...
    norm(Ahat(:,:,3)-pic_A(:,:,3),'fro')/norm(pic_A(:,:,3),'fro')]);

figure(1);  image(pic_A);  axis equal;
figure(2);  image(Ahat);  axis equal;
