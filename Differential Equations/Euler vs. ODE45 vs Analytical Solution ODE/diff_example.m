function [dydt] = diff_example(t, y)
    dydt = y*(1 - y/3);
end