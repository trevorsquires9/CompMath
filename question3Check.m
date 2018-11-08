clear
clc
close all;

%Test logs
start = 5;
terminate = 50;

for i = start:terminate
    A = magic(i);
    [B,p] = pluFact(A,'pivot'); %factorize A using partial pivoting
    [P,L,U] = pluExtract(B,p); %use this to get PLU factors from B
    error = norm(P*A-L*U,2)/norm(A);
    if error > 1e-5 %if bad, print
        fprintf('Partial pivoting does not perform well for matrix A = magic(%d).  It''s error is %e\n',i,error)
    end
end
randTrials = 10;
UB = 500;

for i = 1:randTrials
    A = randn(randi(UB));
    [B,p] = pluFact(A,'pivot'); %factorize A using partial pivoting
    [P,L,U] = pluExtract(B,p); %use this to get PLU factors from B
    error = norm(P*A-L*U,2)/norm(A);
    if error > 1e-5 %if bad, print
        fprintf('Partial pivoting does not perform well for this random matrix.  It''s error is %e\n',i,error)
        disp(A)
    end
end

%% Problem 3 Again
n = 9;
u = -cos((0:n)/n*pi);
A = vander(u);
[B,p] = pluFact(A,'pivot'); %factorize A using partial pivoting
[P,L,U] = pluExtract(B,p); %use this to get PLU factors from B

error = norm(P*A-L*U)/norm(A);
