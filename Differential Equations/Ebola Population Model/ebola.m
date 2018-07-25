function [t_out, y_out] = ebola(tStart, tEnd, yI)
    [t_out, y_out] = ode45(@diffex,[tStart : 5: tEnd], yI);
end 