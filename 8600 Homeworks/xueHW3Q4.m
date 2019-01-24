%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fall 2018 Math 8600 w/ Xue 
%   Homework 3   
%
% Question
%   Problem 4
%
% Function Dependencies
%   pluFact.m
%   pluExtra.m
%   matSolve.m
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

%% Part A
n = [9, 19, 29, 39];
for j = 1:length(n)
    u = -cos((0:n(j))/n(j)*pi);
    A = vander(u);
    A = A + diag((5:5+n(j))');
    matSize = length(A);
    
    diagA = diag(abs(A));
    colSum = sum(tril(abs(A),-1),2) + sum(triu(abs(A),1),2);
    diagDom = 1;
    for i = 1:matSize
        if diagA(i) < colSum
            diagDom = 0;
        end
    end

    [A1] = pluFact(A); %(call your LU factorization without pivoting)
    [A2,p] = pluFact(A,'pivot'); %(call your LU factorization with partial pivoting)
    
    %Adjust my outputs to match expected outputs
    [~,L1,U1] = pluExtract(A1,1:matSize);
    [P,L2,U2] = pluExtract(A2,p);
    
    %Compute error norms
    normReg = norm(A-L1*U1)/norm(A);
    normPivot = norm(P*A-L2*U2)/norm(A);
    nonZReg = [max(abs(nonzeros(L1))) max(abs(nonzeros(U1)))];
    nonZPivot = [max(abs(nonzeros(L2))) max(abs(nonzeros(U2)))];
    
    fprintf('For n = %d,',n(j))
    if diagDom == 1
        fprintf('the matrix is diagonally dominant\n\t')
    else
        fprintf('\n\t')
    end
    fprintf('Error without pivoting = %e\n\t\t with values as large as %e, %e in L,U respectively\n',normReg,nonZReg(1),nonZReg(2))
    fprintf('\t Error with pivoting = %e\n \t\t with values as large as %e, %e in L,U respectively\n\n',normPivot,nonZPivot(1),nonZPivot(2))
end

%% Part b
clear
clc
close all;

n = 100;
A = eye(n);
A(:,n) = ones(n,1);
for i = 2:n
    A(i,1:i-1) = ones(1,i-1)*-1;
end
b = A*ones(n,1);

matSolu = A\b;
mySolu = matSolve(A,b);

[infoMat,p] = pluFact(A,b);
[P,L,U] = pluExtract(infoMat,p);

fprintf('The norm of the (absolute) error between my solution and Matlab''s solution is %e\n',norm(matSolu-mySolu))
myError1 = norm(P*A-L*U)/norm(A);
myError2 = norm(b-A*mySolu)/norm(b);
fprintf('The error of ||PA-LU||/||A|| is %e\nThe error of ||b-Ax||/||b|| is %e\n',myError1,myError2)

%% Part C
[P,Q,L,D,U] = HW3_lucp(A);

b = P*b;
v = L\b;
w = D\v;
y = U\w;
x = Q*y;

myError1 = norm(P*A*Q - L*D*U)/norm(A);
myError2 = norm(b-A*x)/norm(b);

fprintf('The error of ||PA-LU||/||A|| is %e\nThe error of ||b-Ax||/||b|| is %e\n',myError1,myError2)