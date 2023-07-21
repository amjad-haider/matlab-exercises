function plotfunction(vrel, mu_infty, mu0, a, b,option)
    figure(1);
    subplot(2,2,1);
    mu1 = switchfun(vrel, mu_infty, mu0, a, b,1);
    plot(vrel,mu1);
    title("Coulomb"); grid on;
    xlabel("Vrel");
    ylabel("Mu");
    subplot(2,2,2);
    mu2 = switchfun(vrel, mu_infty, mu0, a, b,2);
    plot(vrel,mu2);
    title("Falling friction"); grid on;
    xlabel("Vrel");
    ylabel("Mu");
    subplot(2,2,3);
    mu3 = switchfun(vrel, mu_infty, mu0, a, b,3);
    plot(vrel,mu3);
    title("Stribeck curve"); grid on;
    xlabel("Vrel");
    ylabel("Mu");
end