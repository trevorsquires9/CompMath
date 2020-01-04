clear
clc
close all;

rng('default');
n = 7;
H0 = triu(randn(n,n),-1);

it = 3000;
Hsimul = simulIter(H0,it);
Hqr = pureQRAlg(H0,it);

set = [3,30,300,3000];

relErr = zeros(1,length(set));
relEigErr = zeros(1,length(set));
for i = 1:length(set)
    tmpSI = reshape(Hsimul(:,set(i)), [n n]);
    tmpQR = reshape(Hqr(:,set(i)),[n,n]);
    
    relEigErr(i) = norm(sort(eig(tmpSI,'vector')) - sort(eig(tmpQR,'vector')))/norm(sort(eig(tmpSI,'vector')));
    relErr(i) = norm(tmpSI-tmpQR,'fro')/norm(tmpSI,'fro');
end