function [dydt] = diffex(t, P)
dydt = 0.04*P*(1-P);
    end