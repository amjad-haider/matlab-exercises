%clear workspace and variables
clc, clear, close all;

%%Example Code

A = rand(5)

A_max1 = max(A) %maximum of each column
A_max2 = max(A,[],2) %maximum of each line (second dimension)
A_max2 = max(A,[],'all') %maximum of all entries


B = rand(1,10)
[bmax,ind] = max(B)

data = [25 8 15 5 6 10 10 3 1 20 7];
plot(data); hold on

pks = findpeaks(data)

data = [25 8 15 5 6 10 10 3 1 20 7];
plot(data); hold on

pks = findpeaks(data)

findpeaks(data)

%%Task1

clc, clear, close all;

m = 1;
D = 0.1;
c = 1;
F0 = 1;
tmax = 10000;

amplification(m,D,c,F0,tmax)

