function [dydt] = weekFive(t, y)
    dydt = y*(1 - y/3);
end