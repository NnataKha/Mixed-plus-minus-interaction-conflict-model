clear;
n = 4;
M = rand(n,n);
M(:,2) = zeros(1,n)';
M(2,:) = zeros(1,n);
for i = 1:n
    for j = i:n
        M(i,j) = M(j,i);
    end
end
s = sum(M(1,:));
if s <> 0 then
    M(1,:) = M(1,:)./s;
end
M(:,1) = M(1,:)'

for j = 2:n
    sp = 0;
    for i = j:n
        sp = sp + M(j,i);
    end
    s = 0;
    for i = 1:j-1
        s = s + M(j,i);
    end
    if sp <> 0
        for i = j:n
            M(j,i) = M(j,i)*(1-s)/sp;
        end
    end

    for i = j:n
        M(i,j) = M(j,i);
    end
end
for i = 1:n
    p(i) = sum(M(:,i))
end
for i = 1:n
    r(i) = sum(M(i,:))
end



