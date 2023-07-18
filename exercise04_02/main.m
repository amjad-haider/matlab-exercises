clc,clearvars, close all;

% Example code

% ft = 0:10;
% f = sin(ft);
% 
% t_ode = 0.5:9.5;
% 
% f_ode = interp1(ft,f,t_ode);
% 
% % plot(ft,f,'-o',t_ode,f_ode,'o');
% 
% f_ode_spline = interp1(ft,f,t_ode,'spline');
% f_ode_nearest = interp1(ft,f,t_ode,'nearest');
% 
% plot(ft,f,'-x') %previous plot
% hold on;
% grid on;
% plot(ft(1):0.01:ft(end),sin(ft(1):0.01:ft(end))) %continuous sine wave
% plot(t_ode,f_ode,'o')
% plot(t_ode,f_ode_spline,'o')
% plot(t_ode,f_ode_nearest,'o')
% 
% legend('sine (10 data points)','sine (continous)','linear','spline','nearest','Location','westoutside')

% Task 1 - Zener_m - model

dt = 0.01;
[t_inp,epsilon1_inp] = input_vec_advanced(0.02,0.02,dt); %external function, must be programmed
[~,epsilon2_inp] = input_vec_advanced(0.02,0.05,dt);
[~,sigma1_inp] = input_vec_advanced(50,50,dt);
[~,sigma2_inp] = input_vec_advanced(50,80,dt);


plotfunction(t_inp,epsilon1_inp,epsilon2_inp,sigma1_inp,sigma2_inp)