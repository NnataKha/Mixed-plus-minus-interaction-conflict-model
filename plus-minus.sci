//Change plus/minus interaction depending on the scalar product of the vectors
//main
n = 12;//number of elements
m = 1000;//number of inetrations
epsilon = 0.1;


//Function for setting starting values randomly
function [p, r]=initial(number_of_elements)
    p = rand(number_of_elements,1)
    r = rand(number_of_elements,1)
    s = sum(p)
    p = p ./ s
    s = sum(r)
    r = r ./ s
endfunction

//Function for computing the coefficient responsible for the kind of interaction.
//It depends on theta^N, thta^(N+1) and epsilon, which is the maximum possible
//value for theta (equal to tau_norm*tau_norm)
function coef = coefficient(c, theta, theta_old, delta, epsilon)
    if (epsilon*delta>theta)&(theta<theta_old) then
        coef = 1
    elseif (theta_old<theta)&(theta>(1-epsilon)*delta) then
        coef = -1
    else coef = c
    end
endfunction

//Function for computing the conflict iterations
function [x, y, th, coef]=conflict(p, r, number_of_steps, epsilon)
    theta = sqrt(p'*r)
    tau = min(p, r)
    t = tau ./ sum(tau)
    delta = sqrt(t'*t)
    //initial value for conflict coefficient
    if theta<epsilon then
        c = 1
    else c = -1
    end
    coef = [c]
    th = sqrt(p'*r)
    x = p
    y = r
    for k = 1:number_of_steps
        theta_old = theta
        theta = sqrt(p'*r)
        tau = min(p, r)
        p_temp = p .*(1+theta) + c .* tau
        r_temp = r .*(1+theta) + c .* tau
        c = coefficient(c, theta, theta_old, delta, epsilon)
        s = sum(p_temp)
        p = p_temp ./ s 
        s = sum(r_temp)
        r = r_temp ./ s
        th = cat(2, th, theta)
        x = cat(2, x, p)
        y = cat(2, y, r)
        coef = cat(2, coef, [c])
    end
endfunction

[p, r] = initial(n);//setting initial values
[p_lim, r_lim, theta, c] = conflict(p, r, m, epsilon);//computing conflict 

//visualization
//subplot(211)
//plot(p_lim')
//plot(r_lim', '--')
//xtitle("p (solid line), r (dashed line)")
t = [0:1:m]
//plot(p_lim', r_lim')
plot(t, p_lim)
plot(t, r_lim,'--')

//subplot(212)
//plot(theta)
//plot(c, 'g.-')
//legend('theta', 'c')
//xtitle('theta and c')




