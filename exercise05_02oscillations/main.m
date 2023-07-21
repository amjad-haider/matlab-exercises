%Cleaning
clc, clear, close all;

m = 1;
D = 0.1;
c = 1;
F0 = 1;
tmax = 10000;

alpha = 0.3;      %-0.01 bis 0.3 geht gut

[Omega_up,V_up,Omega_down,V_down] = amplification(m,D,c,alpha,F0,tmax);


figure(1);
plot(Omega_down,V_down,Omega_up,V_up);
xlabel('Omega');
ylabel("V");
legend('Decresing frequency','Incresing frequency','Location','bestoutside');

function [Omega_up,V_up,Omega_down,V_down] = amplification(m,D,c,alpha,F0,tmax)
    
    t_space = linspace(0,tmax,10000);

    d = 2 * D * sqrt(c*m);

    x_0 = 0;

    xdot_0 = 0;

    omega_max=0.2*c/m/1000*tmax;

    [t,y]=ode45(@(t_space,y) odefun(t_space,y,m,d,c,alpha,F0,omega_max,tmax,'up'),[0 tmax],[x_0;xdot_0]);
    [peaks1,locs1]=findpeaks(y(:,1),'MinPeakProminence',0.3);
    Omega_up=0.2*c/m/1000*t;
    V_up=peaks1;
    Omega_up=Omega_up(locs1);

    [t,y]=ode45(@(t,y) odefun(t,y,m,d,c,alpha,F0,omega_max,tmax,'down'),[0 tmax],[x_0;xdot_0]);
    [peaks2,locs2]=findpeaks(y(:,1),'MinPeakProminence',0.3);
    Omega_down=interp1([0 tmax],[omega_max 0],t);
    V_down=peaks2;
    Omega_down=Omega_down(locs2);

end