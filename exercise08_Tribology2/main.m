clc, clear, close all;


%% Example Code
scenario = 2;
error = 0; v0 = 30; 
switch scenario
    case 1
        name = 'smooth';
        reaction = 0.5;
        deceleration = 2;
    case 2
        name = 'dry';
        reaction = 0.5;
        deceleration = 7;
    case 3
        name = 'dark';
        reaction = 1;
        deceleration = 7;
    otherwise
        error = 1;
end

if error==0
    disp(['Scenario "' name '", Stopping distance: ' num2str(v0*reaction+0.5*v0^2/deceleration) ' m'])
else
    disp('There is an error')
end

x = [-5 -1e-6 0 1e-6 5];
y = sign(x);
plot(x,y,'o-')
ylim([-2 2])
grid on


x = [-5 -1e-6 0 1e-6 5];
y = heaviside(x);
plot(x,y,'o-')
ylim([-0.5 1.5])
grid on



x0 = 1.05; tol = 1e-2;
xNewton1 = myNewton(x0, tol)

x0 = -0.95; tol = 1e-2;
xNewton2 = myNewton(x0, tol)



%% Tribology 2
%Friction Transducer
clc, clear, close all;


%Parameters
vrel = -10:0.01:10;
mu_infty = 0.3;
mu0 = 0.45;
a = 5;
b = 1e-3;

plotfunction(vrel, mu_infty, mu0, a, b,"eng");



vBand = 2;
D = [0 0.5 1];
m = 1;
c = 1;

figure('Name','D = 0');
plotfunctionODE(m, c, D(1), vBand, mu_infty, mu0, a, b,"eng")
figure('Name','D = 0.5');
plotfunctionODE(m, c, D(2), vBand, mu_infty, mu0, a, b,"eng")
figure('Name','D = 1');
plotfunctionODE(m, c, D(3), vBand, mu_infty, mu0, a, b,"eng")

%%FUnction definitions

function x = myNewton (x0, tol)
     x(1) = x0 ;
     k = 1;
     while abs(x(k)^2 - 2*x(k)) > tol 
        x(k +1) = x(k) - (x(k)^2 - 2*x(k))/(2*x(k) - 2);
        k = k +1;
     end
end
