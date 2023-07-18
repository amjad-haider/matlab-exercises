clc,clearvars,close all;

% ExampleCode

% A = [1 2; 3 4; 5 6];
% b = [10; 20; 30];
% x0 = [0; 0];
% 
% [x,z] = fmincon(@(x)fun1(x), x0, A, b)

x_init = [1; 1; 1]; % initial value for length width height
xopt = fmincon(@(x)VolVal(x), x_init, [], [], [], [], [], [], @(x)constr(x));
output(xopt);