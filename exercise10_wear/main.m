clc , clear, close all;

%% Example Code

x = randn(10000,1);
h = histogram(x);

histfit(x);


param = fitdist(x,'Normal'); %other forms of distribution would also be possible
y = normpdf(-4:0.1:4,param.mu,param.sigma); %normal distribution from mu and sigma, pdf: probability density function
subplot(1,2,1)
histogram(x,100);
xlim([-4 4])
subplot(1,2,2) 
plot(-4:0.1:4,y)