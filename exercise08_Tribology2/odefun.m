function dydt = odefun(t,y,m, c, D, vBand, mu_infty, mu0, a, b,types)
    d=2*D*sqrt(c/m);
    if ((abs(vBand-y(2))<0.01) && (abs(d*y(2)+c*y(1))<=mu0*m*9.81))
        dydt=[vBand;0];
    else
        vrel=vBand-y(2);
        dydt=[y(2); (m*9.81.*switchfun(vrel, mu_infty, mu0, a, b,types)-c.*y(1)-d.*y(2))/m];
    end
end