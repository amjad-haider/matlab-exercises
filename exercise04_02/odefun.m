function odefun(t_inp,epsilon1_inp,epsilon2_inp,sigma1_inp,sigma2_inp,E1,E2,eta,options,dt)
 
    epsilon1_dot = gradient(epsilon1_inp,dt);
    [t_sigma1,sigma1]=ode23(@(t,sigma) ode_relax(t,sigma,t_inp,epsilon1_inp,epsilon1_dot,E1,E2,eta),[0 5],0,options);
    subplot(2,2,1);
    plot(t_sigma1,sigma1);
    xlabel("t in s")
    ylabel('σ1');
    title('Relaxation test 1');
    grid on;
    epsilon2_dot = gradient(epsilon2_inp,dt);
    [t_sigma2,sigma2]=ode23(@(t,sigma) ode_relax(t,sigma,t_inp,epsilon2_inp,epsilon2_dot,E1,E2,eta),[0 5],0,options);
    subplot(2,2,2);
    plot(t_sigma2,sigma2);
    xlabel("t in s")
    ylabel('σ2');
    title('Relaxation test 2');
    grid on;
    sigma1_dot = gradient(sigma1_inp,dt);
    [t_epsilon1,epsilon1]=ode23(@(t,epsilon) ode_creep(t,epsilon,t_inp,sigma1_inp,sigma1_dot,E1,E2,eta),[0 5],0,options);
    subplot(2,2,3);
    plot(t_epsilon1,epsilon1);
    xlabel("t in s")
    ylabel('ɛ1');
    title('Creep test 1');
    grid on;
    sigma2_dot = gradient(sigma2_inp,dt);
    [t_epsilon2,epsilon2]=ode23(@(t,epsilon) ode_creep(t,epsilon,t_inp,sigma2_inp,sigma2_dot,E1,E2,eta),[0 5],0,options);
    subplot(2,2,4);
    plot(t_epsilon2,epsilon2);
    xlabel("t in s")
    ylabel('ɛ2');
    title('Creep test 2');
    grid on;
end


function [dsigma] = ode_relax(t,sigma,t_inp,epsilon,epsilon_dot,E1,E2,eta)
    a = eta/E1;
    b = E2;
    c=eta*(1+E2/E1);
    epsilon = interp1(t_inp,epsilon,t);
    epsilon_dot = interp1(t_inp,epsilon_dot,t);
    dsigma = (b*epsilon + c*epsilon_dot - sigma)/a;
    %dsigma =dsigma';% Transpose to create a column vector
end


function depsilon = ode_creep(t,epsilon,t_inp,sigma,sigma_dot,E1,E2,eta)
    a = eta/E1;
    b = E2;
    c=eta*(1+E1/E2);
    sigma = interp1(t_inp,sigma,t);
    sigma_dot = interp1(t_inp,sigma_dot,t);
    depsilon = (sigma + a*sigma_dot - b*epsilon)/c;
    %depsilon = depsilon'; % Transpose to create a column vector
end



% function ode_function(t, epsilon1, epsilon2, sigma1, sigma2, E1, E2, eta, options)
%     % Solve the differential equations for the Zener model
%     [~, epsilon_dot] = ode45(@(t, epsilon_dot) creep_equation(t, epsilon_dot, sigma1, sigma2, E1, E2, eta), t, 0, options);
%     [~, sigma_dot] = ode45(@(t, sigma_dot) relaxation_equation(t, sigma_dot, epsilon1, epsilon2, E1, E2, eta), t, 0, options);
% 
%     % Plot the results
%     figure;
%     subplot(2, 1, 1);
%     plot(t, epsilon_dot);
%     xlabel('Time');
%     ylabel('Strain rate');
%     title('Creep Test');
% 
%     subplot(2, 1, 2);
%     plot(t, sigma_dot);
%     xlabel('Time');
%     ylabel('Stress rate');
%     title('Relaxation Test');
% end
% 
% function epsilon_dot = creep_equation(t, epsilon_dot, sigma1, sigma2, E1, E2, eta)
%     % Interpolate stress values at time t
%     sigma = interp1(t, sigma1, t);
%     % Calculate strain rate using the Zener model equation for creep
%     epsilon_dot = (sigma - (E2 * epsilon_dot + eta * (1 + E2/E1) * sigma2)) / (E1 + eta/E1);
% end
% 
% function sigma_dot = relaxation_equation(t, sigma_dot, epsilon1, epsilon2, E1, E2, eta)
%     % Interpolate strain values at time t
%     epsilon = interp1(t, epsilon1, t);
%     % Calculate stress rate using the Zener model equation for relaxation
%     sigma_dot = (epsilon - (E1 * sigma_dot + eta * (1 + E2/E1) * epsilon2)) / (E2 + eta/E1);
% end
