clc,clearvars,close all;

% Example1 
% function with constraints (inequality) is to be minimized
A = [1 2; 3 4; 5 6];
b = [10; 20; 30];
x0 = [0; 0];

[x1,z1] = fmincon(@(x)fun1(x), x0, A, b);



% Example2
% X = fmincon(FUN,X0,A,B,Aeq,Beq) minimizes FUN subject to the linear 
%     equalities Aeq*X = Beq as well as A*X <= B. (Set A=[] and B=[] if no 
%     inequalities exist.)

Aeq = [1 2; 3 4; 5 6];
beq = [10; 20; 30];
x0 = [0; 0];
[x2,z2] = fmincon(@(x)fun1(x), x0, [], [], Aeq, beq)

% Example 3
% with lower and upper limits


A = [1 2; 3 4; 5 6];
b = [10; 20; 30];
x0 = [0; -10];
lb = [-5; -20];
ub = [5; -5];
[x3,z3] = fmincon(@(x)fun1(x), x0, A, b, [], [], lb, ub)

%Non-linear quantities
% X = fmincon(FUN,X0,A,B,Aeq,Beq,LB,UB,NONLCON) subjects the minimization
%     to the constraints defined in NONLCON. The function NONLCON accepts X 
%     and returns the vectors C and Ceq, representing the nonlinear 
%     inequalities and equalities respectively. fmincon minimizes FUN such 
%     that C(X) <= 0 and Ceq(X) = 0. (Set LB = [] and/or UB = [] if no bounds
%     exist.)

x_init = [1; 1; 1]; % initial value for length width height
xopt = fmincon(@(x)VolVal(x), x_init, [], [], [], [], [], [], @(x)constr(x));
output(xopt);


