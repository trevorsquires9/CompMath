function [P,Q,L,D,U] = HW3_lucp(A)
[m,n] = size(A);
if m ~= n
    error('GECP can only handle square matrices.\n');
end
dg = zeros(n,1);
% initialize permutation vector p and q
p = 1:n;    q = 1:n;
% LU decomposition with complete pivoting 
for k = 1:n-1
    % find row and column index of the whole submatrix 
    [colmax,rowidx] = max(abs(A(k:n,k:n)));
    [~,colidx] = max(colmax);
    pdx = rowidx(colidx) + k-1;
    qdx = colidx + k-1;
    % interchange rows k and q and record this in p 
    A([k,pdx],:) = A([pdx,k],:);
    p([k,pdx]) = p([pdx,k]);
    A(:,[k,qdx]) = A(:,[qdx,k]);
    q([k,qdx]) = q([qdx,k]);
    % compute the corresponding column of L
    dg(k) = A(k,k);
    actdx = k+1:n;
    A(actdx,k) = A(actdx,k) / dg(k);
    A(k,actdx) = A(k,actdx) / dg(k);
    % update
    A(actdx,actdx) = A(actdx,actdx) - A(actdx,k)*dg(k)*A(k,actdx);
end
dg(n) = A(n,n);

P = eye(n,n);   P = P(p,:);
Q = eye(n,n);   Q = Q(:,q);
L = tril(A,-1) + eye(n,n);
U = triu(A,+1) + eye(n,n);
D = diag(dg);