function plotfunctionODE(m, c, D, vBand, mu_infty, mu0, a, b,option)

    [t1,y1]=ode23(@(t,y) odefun(t,y,m, c, D, vBand, mu_infty, mu0, a, b,1),[0 100],[0;0]);
    subplot(2,3,1)
    plot(y1(:,1),y1(:,2));grid on;
    xlabel('Distance');
    ylabel('Velocity');
    title('Coulomb');

    subplot(2,3,4)
    plot(t1,y1(:,2),t1,y1(:,1)); grid on;
    legend("v","x");

    [t2,y2]=ode23(@(t,y) odefun(t,y,m, c, D, vBand, mu_infty, mu0, a, b,2),[0 100],[0;0]);
    subplot(2,3,2)
    plot(y2(:,1),y2(:,2));grid on;
    xlabel('Distance');
    ylabel('Velocity');
    title('Falling Friction Curve');

    subplot(2,3,5)
    plot(t2,y2(:,2),t2,y2(:,1)); grid on;
    legend("v","x");

    [t3,y3]=ode23(@(t,y) odefun(t,y,m, c, D, vBand, mu_infty, mu0, a, b,3),[0 100],[0;0]);
    subplot(2,3,3)
    plot(y3(:,1),y3(:,2));grid on;
    xlabel('Distance');
    ylabel('Velocity');
    title('Stribeck Curve');

    subplot(2,3,6)
    plot(t3,y3(:,2),t3,y3(:,1)); grid on;
    legend("v","x");
end