clear;
n=4//number of steps
//setting random values to T and M
for i=1:n
    T(i)=rand(100);
    M(i)=rand(100);
end
//M=[0.5,1.5,3,4]';
//T=[1,5,9,11]';
//M=[0.3076270773539253;0.2862893346342559;0.34336478245952484;0.0271880555229399];
//T=[0.4423636783115587;0.17600591303341878;0.3087916240091037;0.0283878464591878];

st = sum(T);
sm = sum(M);
//making vectors stochastic
T = T'./st;
M = M'./sm;

eps=1/(n*n*n*n);

m = 80;//number of steps
check(1)=1;
for k = 1:m
    time(k)=k;
    T_v(k,:)=T;
    M_v(k,:)=M;
    Theta=0;
    for i=1:n
        Theta = Theta + sqrt(T(i)*M(i));
    end
    check(k+1)=check(k);

    //check the value of Theta
    if Theta<=eps then
        check(k+1)=1;
    elseif Theta>=1-eps then
        check(k+1)=2;
    end

    tau = min(T,M);
    W = sum(tau);
    //choosing “+,+” or  “-,-”
    if check(k+1)==1 then
        z = 1+Theta+W;
        T = (T.*(1+Theta)+tau)./z;
        M = (M.*(1+Theta)+tau)./z;
        elseif check(k+1)==2 then
            z = 1+Theta-W;
            T = (T.*(1+Theta)-tau)./z;
            M = (M.*(1+Theta)-tau)./z;
        end
end
//subplot(211)
plot(time,T_v);
//legend('T(1)','T(2)','T(3)','T(4)','T(5)','T(6)','T(7)','T(8)');

//subplot(212)
plot(time,M_v,'--');
//legend('M(1)','M(2)','M(3)','M(4)','M(5)','M(6)','M(7)','M(8)');
//xs2pdf(gcf(),"C:\Users\mika\Desktop\imath\article\pictures\pic.eps");

