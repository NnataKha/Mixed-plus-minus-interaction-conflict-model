clear
n = 4;
//agents' distributions
p = rand(1,n);
r = rand(1,n);
//r = [0.03053683050646518, 0.11073078001924284, 0.13514332170253243, 0.027459361426200053, 0.07190506521083669, 0.18616162768783842, 0.21079054986970286, 0.22727246357718153];
//p = [0.0058629416842367315, 0.21299083861261242, 0.033062392801051596, 0.12873295311381222, 0.04371662605906716, 0.20406945190899564, 0.19905651573819597, 0.17250828008202823];
sp = sum(p);
sr = sum(r);
p = p./sp;
r = r./sr;
con_p = [0, .1, 0, 0;//, 0, .1;
         .1, 0, .1, 0;//, 0, 0;
         0, .1, 0, .1;//, 0, 0;
         0, 0, .1, 0]//, .1, 0;
         //0, 0, 0, .1, 0, .1;
         //.1, 0, 0, 0, .1, 0]
con_r = con_p;
time(1) = 1;
p_v(1,:) = p;
r_v(1,:) = r;
con_v(1,:) = con_p(1,:);

T = 350
//conflict interaction
for k = 1:T
    time(k+1) = k+1;
    tau = min(p,r);
    p = p + p * con_p - tau;
    r = r + r * con_r - tau;
    sp = sum(p);
    p = p ./ sp;
    sr = sum(r);
    r = r ./ sr;
    p_v(k+1,:) = p;
    r_v(k+1,:) = r;
    con_v(k+1,:) = con_p(1,:);
end
//distribution
if 1 == 21 then
subplot(221)
plot(r_v(:,1),p_v(:,1),'.-');
subplot(222)
plot(r_v(:,2),p_v(:,2),'.-');
subplot(223)
plot(r_v(:,3),p_v(:,3),'.-');
subplot(224)
plot(r_v(:,4),p_v(:,4),'.-');
else 
    plot(time,p_v);
    plot(time,r_v,'--');
end
//plot(time,p_v);
//plot(time,r_v,'--');
//subplot(212)
//plot(time,con_v);




