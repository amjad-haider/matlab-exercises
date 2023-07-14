function [t,sigma] = stress_vec(maximum,dt)

    t = 0:0.1:5;

    sigma = zeros(length(t));

    sigma(t>1 & t <4) = maximum;

end