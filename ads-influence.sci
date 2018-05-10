//Change plus/minus interaction depending on the scalar product of the vectors
//main
clear;

m = 40;//number of inetrations
n = 1; //number of agents
a = [1,0];
v = ones(1,2)
v(1) = abs(rand()/2)
v(2) = 1- v(1)
agents(:,1) = zeros(n,1);
agents(:,2) = ones(n,1);
p = [0,0];
for i=1:n
    for j =1:2
        X(i,1,j) = agents(i,j)
    end
end
 
for k = 1:m
    for i = 1:n
        p = [X(i,k,1), X(i,k,2)]
        tau = max(v.*p, v.*a)
        p_temp = p + tau
        s = sum(p_temp)
        p = p_temp ./ s
        X(i,k+1,1) = p(1)
        X(i,k+1,2) = p(2)
    end
    Value(k,:) = v .* p
end
t = [1:1:m]
//V = v'*ones(1,number_of_steps) 
plot(Value)
legend('innovation', 'old product')
for i=1:n
    for k=1:m
        y1(k,1) = X(i,k,1)
        y2(k,2) = X(i,k,2)
    end
    plot(t',y1,'b--',t',y2,'g--')
end
