function [output] = andersonSubProblem(alpha,x,xtilde,m,k)
output = 0;
for i = 1:m
    output = output + alpha(i)*(xtilde(:,k-i+1)-x(:,k-i));
end
output = output + (1-ones(m,1)'*alpha)*(xtilde(:,k-m)-x(:,k-m-1));
output = norm(output);


