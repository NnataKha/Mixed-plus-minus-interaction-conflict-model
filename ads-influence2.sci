//Change plus/minus interaction depending on the scalar product of the vectors
//main
clear;
number_of_steps = 50;//number of inetrations
n = 3; //number of agents
a = [1,0];
agents(:,1) = zeros(n,1);
agents(:,2) = ones(n,1);
for i = 1:n
    val(i,1) =  abs(rand());
    val(i,2) =  abs(rand());
    s = val(i,1)+val(i,2);
    val(i,1) = val(i,1) / s;
    val(i,2) = val(i,2) / s;
end
p = [0,0];
for i=1:n
    for j =1:2
        X(i,1,j) = agents(i,j)
    end
end
 
for k = 1:number_of_steps
//    Value(k,:) = v
    for i = 1:n
        p = [X(i,k,1) X(i,k,2)]
        v = val(i,:)
        tau = max(v.*p, v.*a)
        p_temp = p + tau
        s = sum(p_temp)
        p = p_temp ./ s 
        X(i,k+1,1) = p(1)
        X(i,k+1,2) = p(2)
    end
end
t = [1:1:number_of_steps]
mean_val = mean(val,'c');
for k = 1:number_of_steps
    for i =1:n
        for j = 1:2
            temp(j,i) = X(i,k,j)
        end
    end
    mean_agents(k,1) = mean(temp(1,:),'c');
    mean_agents(k,2) = mean(temp(2,:),'c');
end
//t=[1:1:number_of_steps+1]
//V1 = mean_val(1).*ones(1,number_of_steps+1) 
//V2 = mean_val(2).*ones(1,number_of_steps+1) 
//plot(t,V1,'r',t,V2,'r')
//plot(mean_agents)
//legend('innovation', 'old product')
for i=1:n
    for k=1:number_of_steps
        y1(i,k) = X(i,k,1)
        y2(i,k) = X(i,k,2)
    end
end
plot(t',y1,'--')
plot(t',y2)
