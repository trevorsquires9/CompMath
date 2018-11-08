clear
clc
close all;

f = @(x) (x.*cos(x) - sin(x))./x.^2;
lb = -10;
ub = 10;

t = lb:0.001:ub;
ft = f(t);

points = length(t);
num_pts = 100;

rand_pts = randi(points-2,1,num_pts)+1;
rand_pts = [1, sort(rand_pts), points];
frand_pts = f(t(rand_pts));

%% Now approximate ft using a polynomial
coeff = monoInterp(t(rand_pts),frand_pts);

x0 = rand()*20-10;
tol = 1e-8;


%% Test it
plot(t(rand_pts),frand_pts,'k-')
hold on
plot(t,f(t),'r--')
hold on
f_approx = zeros(1,length(t));
for i = 1:length(t)
    f_approx(i) = polyval(coeff,t(i));
end
%plot(t,f_approx)


%roots = polyRootFinder(a,x0,tol);