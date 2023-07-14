clc;clearvars; close all;


%%Task1 - Spring

maximum = 50;
dt = 0.1;

[t,sigma] = stress_vec(maximum,dt);

E = 750;

epsilon_hooke = strain_hooke(t,sigma,E);


figure;
plot(t, epsilon_hooke);
grid on;
xlabel('Time (s)');
ylabel('Stress');
title('Stress vs. Time');