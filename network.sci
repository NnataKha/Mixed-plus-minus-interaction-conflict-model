clear
n = 8;
//agents' distributions
p = rand(1,n);
r = rand(1,n);
//p = [0.29840927593458944,0.16714816354485756,0.1224551849039676,0.4119873756165854];
// = [0.36651905742558666,0.21277821541047434,0.13286307370803582,0.2878396534559032];
sp = sum(p);
sr = sum(r);
p = p./sp;
r = r./sr;
    for i = 1:n
        for j = i:n
            rnd = rand();
            if rnd > .2 then
                con_p(i,j) = 0
            else con_p(i,j) = rnd
            end
            if i == j then 
                con_p(i,j) = 0
            end
            con_p(j,i) = con_p(i,j);
        end
    end

    for i = 1:n
        for j = i:n
            rnd = rand();
            if rnd > .2 then
                con_r(i,j) = 0
            else con_r(i,j) = rnd
            end
            if i == j then 
                con_r(i,j) = 0
            end
            con_r(j,i) = con_r(i,j);
        end
    end

    s = sum(con_p(1,:));
    if s <> 0 then
        con_p(1,:) = con_p(1,:)./s;
    end
    con_p(:,1) = con_p(1,:)'
    
    for j = 2:n
        sp = 0;
        for i = j:n
            sp = sp + con_p(j,i);
        end
        s = 0;
        for i = 1:j-1
            s = s + con_p(j,i);
        end
        if sp <> 0 then
            for i = j:n
                con_p(j,i) = con_p(j,i)*(1-s)/sp;
            end
        end
        for i = j:n
            con_p(i,j) = con_p(j,i);
        end
    end
    s = sum(con_r(1,:));
    if s <> 0 then
        con_r(1,:) = con_r(1,:)./s;
    end
    con_r(:,1) = con_r(1,:)'
    
    for j = 2:n
        sp = 0;
        for i = j:n
            sp = sp + con_r(j,i);
        end
        s = 0;
        for i = 1:j-1
            s = s + con_r(j,i);
        end
        if sp <> 0 then
            for i = j:n
                con_r(j,i) = con_r(j,i)*(1-s)/sp;
            end
        end
        for i = j:n
            con_r(i,j) = con_r(j,i);
        end
    end

time(1) = 1;
p_v(1,:) = p;
r_v(1,:) = r;
con_v(1,:) = con_p(1,:);

T = 500
//conflict interaction
for k = 1:T

   //connections matrix
    if 1 == 41 then
        for i = 1:n
            for j = i:n
                rnd_p = rand();
                rnd_r = rand();
                if rnd_p > .6 then
                    con_p(i,j) = 0
                else con_p(i,j) = rnd_p
                end
                if i == j then 
                    con_p(i,j) = 0
                end
                con_p(j,i) = con_p(i,j);
                if rnd_r > .6 then
                    con_r(i,j) = 0
                else con_r(i,j) = rnd_r
                end
                if i == j then 
                    con_r(i,j) = 0
                end
                con_r(j,i) = con_r(i,j);
            end
        end
     else //con = zeros(n,n)
         c = n/5
        for i = 1:n
            for j = i:n
                rnd_p = rand();
                rnd_r = rand();
                if (con_p(i,j) > 0) & (rnd_p < c/n) then 
                    con_p(i,j) = 0
                end
                if (con_p(i,j) > 0) & (rnd_p >= c/n) then
                    con_p(i,j) = con_p(i,j) + rnd_p / n
                end
                if con_p(i,j) == 0 & (rnd_p < c/n) then
                    con_p(i,j) = rnd_p / n
                end
                if con_p(i,j) == 0 & (rnd_p >= c/n) then
                    con_p(i,j) = 0
                end
                if i == j then 
                    con_p(i,j) = 0
                end
                con_p(j,i) = con_p(i,j);
                if (con_r(i,j) > 0) & (rnd_r < c/n) then 
                    con_r(i,j) = 0
                end
                if (con_r(i,j) > 0) & (rnd_r >= c/n) then
                    con_r(i,j) = con_r(i,j) + rnd_r / n
                end
                if con_r(i,j) == 0 & (rnd_r < c/n) then
                    con_r(i,j) = rnd_r / n
                end
                if con_r(i,j) == 0 & (rnd_r >= c/n) then
                    con_r(i,j) = 0
                end
                if i == j then 
                    con_r(i,j) = 0
                end
                con_r(j,i) = con_r(i,j);
            end
        end
     end
    s = sum(con_p(1,:));
    if s <> 0 then
        con_p(1,:) = con_p(1,:)./s;
    end
    con_p(:,1) = con_p(1,:)'
    
    for j = 2:n
        sp = 0;
        for i = j:n
            sp = sp + con_p(j,i);
        end
        s = 0;
        for i = 1:j-1
            s = s + con_p(j,i);
        end
        if sp <> 0 then
            for i = j:n
                con_p(j,i) = con_p(j,i)*(1-s)/sp;
            end
        end
        for i = j:n
            con_p(i,j) = con_p(j,i);
        end
    end
    s = sum(con_r(1,:));
    if s <> 0 then
        con_r(1,:) = con_r(1,:)./s;
    end
    con_r(:,1) = con_r(1,:)'
    
    for j = 2:n
        sp = 0;
        for i = j:n
            sp = sp + con_r(j,i);
        end
        s = 0;
        for i = 1:j-1
            s = s + con_r(j,i);
        end
        if sp <> 0 then
            for i = j:n
                con_r(j,i) = con_r(j,i)*(1-s)/sp;
            end
        end
        for i = j:n
            con_r(i,j) = con_r(j,i);
        end
    end

    time(k+1) = k+1;
    theta = 0//sqrt(sum(p.*r));
    tau = 0//min(p,r);
    W = sum(tau);
//    zp = 1 + W + theta + sum(p * con) - sum(r * con);
 //   zr = 1 + W + theta + sum(r * con) - sum(p * con);
    p = p .* (1+theta) - r * con_r + r + tau; 
    r = r .* (1+theta) - p * con_p + p + tau;
    for i=1:n
        if p(i)<0 then
            p(i) = 0;
        end
        if r(i)<0 then
            r(i) = 0;
        end
    end
    sp = sum(p);
    p = p ./ sp;
    sr = sum(r);
    r = r ./ sr;
    p_v(k+1,:) = p;
    r_v(k+1,:) = r;
    con_v(k+1,:) = con_p(1,:);
end
//distribution
subplot(211)
plot(time,p_v);
plot(time,r_v,'--');
subplot(212)
plot(time,con_v);




