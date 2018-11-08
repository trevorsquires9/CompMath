clear
clc

n = 7;
list = zeros(1,n);
i = 1;

while i <= n
    temp = randi(2);
    if temp == 2
        list(i) = 1;
        i = i+2;
    else
        i = i+1;
    end
end