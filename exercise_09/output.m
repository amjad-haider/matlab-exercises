function output(xopt)
    L = [' optimized length:',num2str(xopt(1))];
    % L = xopt(1);
    W = [' optimized width:',num2str(xopt(2))];
    H = [' optimized height:',num2str(xopt(3))];
    areaValue = 2 * xopt(1) * xopt(2) + 2 * xopt(2) * xopt(3) + 2 * xopt(3) * xopt(1) ;
    Area = [' optimized area:',num2str(areaValue)];
    volumeValue = xopt(1) * xopt(2) * xopt(3);
    Volume = [' optimized volume:',num2str(volumeValue)];


    disp(L);
    disp(W);
    disp(H);
    disp(Area);
    disp(Volume);
end
