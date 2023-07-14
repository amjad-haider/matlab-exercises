function epsilon_newton = strain_newton(t,sigma,eta)
   epsilon_dot = sigma / eta;
   epsilon_newton = cumtrapz(t,epsilon_dot);
end