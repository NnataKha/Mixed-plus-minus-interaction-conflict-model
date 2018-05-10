//Change plus/minus interaction depending on the scalar product of the vectors
//main
clear;

m = 10;//number of inetrations
n = 1; //number of agents
items = 3;//number of items to choose
a = zeros(items,1);
a(1) = 1;
v = abs(rand(n,items))//value of the item 
s = sum(v,'c')
choices = abs(rand(n,items));//choices of agents
choices(:,1) = zeros(n,1);
s_c = sum(choices,'c')
for i = 1:n
    for j = 1:items
        v(i,j) = v(i,j) / s(i)
        choices(i,j) = choices(i,j) / s_c(i)
    end
end

for i=1:n
    for j =1:items
        X(i,1,j) = choices(i,j)
        Val(i,1,j) = v(i,j)
    end
end
 
for k = 1:m
    //Value(k,:) = v
    for i = 1:n
        for j=1:items
            p(j) = X(i,k,j)
            tau(j) = max(v(i,j)*p(j), v(i,j)*a(j))
        end
        p_temp = p + tau
        s = sum(p_temp)
        p = p_temp ./ s
        s = 0
        for j=1:items
            X(i,k+1,j) = p(j)
            Val(i,k+1,j) = v(i,j)
        end
    end
end
t = [1:1:m+1]
//V = v'*ones(1,number_of_steps) 
//plot(Value)
//legend('innovation', 'old product')
for i=1:n
    for k=1:m
        for j = 1:items
            y(k,j) = X(i,k,j)
            value(k,j) = Val(i,k,j)
        end
    end
    f=scf(0);  
    plot(y)
//    legend('choice1', 'choice2', 'choice3')
    plot(value,'--')
//    legend('v1', 'v2', 'v3')
//    pause
//    clf(f)
end
