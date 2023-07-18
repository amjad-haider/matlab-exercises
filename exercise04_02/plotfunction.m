function plotfunction(t_inp,epsilon1_inp,epsilon2_inp,sigma1_inp,sigma2_inp)
    figure(1);
    
    subplot(2,2,1);
    
    plot(t_inp,epsilon1_inp);
    grid on;
    xlabel("t in s")
    ylabel('ɛ1');
    title('Relaxation test 1');
    subplot(2,2,2);
    plot(t_inp,epsilon2_inp);
    xlabel("t in s")
    ylabel('ɛ2');
    title('Relaxation test 2');
    subplot(2,2,3);
    plot(t_inp,sigma1_inp);
    xlabel("t in s")
    ylabel('σ1');
    title('Creep test 1');
    subplot(2,2,4);
    plot(t_inp,sigma2_inp);
    xlabel("t in s")
    ylabel('σ2');
    title('Creep test 2');
end