function amplification(m,D,c,F0,tmax)
    %Parameters

    t=linspace(0,800,10000);
    f=F0*sin(0.2.*c./m.*t./1000./2.*t);
    
    subplot(4,1,1);
    plot(t,f);
    ylabel('F(t)');
    xlabel('t')
    title('The variation in time of the force excitation F(t)')


    t1=linspace(0,tmax,10000);
    omega_max=0.2*c/m/1000*tmax;
    tspan = [0 tmax];
    y0 = [0 0];
    [t_out,y]=ode45(@(t1,y) odefun(t1,y,m,c,D,F0), tspan, y0);
    
    %omega=t_out*0.2*c/m/1000;
    omega = interp1([0 tmax],[0,omega_max],t_out);
    subplot(4,1,2);
    plot(omega,y(:,1));
    xlabel('Ω(t)');
    ylabel('y(t)');
    title('y(t) based on Ω(t)')

    
    eta=omega/sqrt(c/m);
    subplot(4,1,3);


    [peaks,locs]=findpeaks(y(:,1));
    om=eta(locs);
    plot(om,peaks);
    xlabel('η');
    ylabel('V');
    subplot(4,1,4);
    [up,low]=envelope(y(:,1),50,'peak');
    plot(eta,up);
    xlabel('η');
    ylabel('V');
end