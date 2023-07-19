function dydt = odefun(t,y,m,c,D,F0)
dydt = [y(2); 1/m*(F0.*sin(0.2.*c./m.*t/1000/2.*t)-y(1)*c-2.*D.*sqrt(c.*m).*y(2))];
%dydt = dydt'; % Transpose to create a column vector
end