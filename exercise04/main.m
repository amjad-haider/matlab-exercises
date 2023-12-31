clc;clearvars; close all;


%%Task1 - Spring

maximum = 50;
dt = 0.1;

[t,sigma] = stress_vec(maximum,dt);

E = 750;

epsilon_hooke = strain_hooke(t,sigma,E);


%%Task 2 - Damper
% 
eta = 10000;
epsilon_newton = strain_newton(t,sigma,eta);


%%Additionao

figure;
plot(t, epsilon_newton);
grid on;
xlabel('Time (s)');
ylabel('Stress');
title('Stress vs. Time');