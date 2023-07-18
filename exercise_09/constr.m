function [c,ceq] = constr(x)
    c = (2.*x(1).*x(2)+2.*x(2).*x(3)+2.*x(1).*x(3)-10);
    ceq=[];
end