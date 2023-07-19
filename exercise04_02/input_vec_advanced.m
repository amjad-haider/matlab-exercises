function [t,epsilon] = input_vec_advanced(min,max,dt)
    t1=0;
    t2=5;
    t = t1:dt:t2;
    tstart=1;
    tend=4;
    epsilon=zeros(size(t));
    first = find(t==tstart);
    last = find(t==tend);
    epsilon(1,first:last)=linspace(min,max,(last-first+1));
end