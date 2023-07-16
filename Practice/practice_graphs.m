clc;clearvars; close all;

x = linspace(-2,8,11);
y = ones(1,length(x));
y(2:4) = 2:4;
y(5,6) = 4;
y(10) = 8;

plot(x,y,'o--');
 