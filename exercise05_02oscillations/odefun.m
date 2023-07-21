function dydt = odefun(t,y,m,d,c,alpha,F0,omega_max,tmax,sweep)
    f0=0;
    if strcmp(sweep,'up')
        F=F0*chirp(t,f0,tmax,omega_max/2/pi,[],-90);
    else 
        F=F0*chirp(t,omega_max/2/pi,tmax,f0,[],-90);
    end
    dydt=[y(2); F/m-c/m*y(1)-alpha*y(1)^3-d/m*y(2)];
end