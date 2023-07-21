function mu = switchfun(vrel, mu_infty, mu0, a, b,type)
    switch type
        case 1 % Coulomb friction
            mu=mu_infty.*sign(vrel);
            for i=1:length(mu)
                if mu(i)==0
                    mu(i+1)=mu0;
                    mu(i-1)=-mu0;
                end
            end
        case 2 %falling friction 
            mu=((mu0-mu_infty)./(1+a.*abs(vrel))+mu_infty).*sign(vrel);
        case 3 % Stribeck Curve
            mu=((mu0-mu_infty)./(1+a.*abs(vrel))+b.*abs(vrel.^2)+mu_infty).*sign(vrel);
    end
end