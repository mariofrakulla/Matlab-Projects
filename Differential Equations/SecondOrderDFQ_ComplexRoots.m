%Author: Mario Frakulla
%Date: 02/08/2018
clear all;
clc;
close all;
%% 2nd Order Homogenous DFQ with complex roots, computation
rOne = -3+4i;
rTwo = -3 - 4i; 
coefMat = [1 1; rOne rTwo];
freeMat = [2; 2];
solMat = inv(coefMat) * freeMat;
cOne = solMat(1);
cTwo = solMat(2);
t = 0: 0.01: 10; 
yt = cOne* exp(rOne*t)  + cTwo* exp(rTwo*t); 
figure(3)
plot(t, yt, 'Color', 'Blue', 'LineWidth', 1.25)
grid on 
xlabel('time')
ylabel('y(t)')
%% DFQ 2
clear all;
clc;
hold on
r1 = (-1/6) + i; %complex conjugate roots
r2 = (-1/6) - i;
alpha = (-1/6); % alpha + beta*i 
beta = 1;
matTwo = [1 0; alpha beta]; 
coefTwo = [0.7; 0.1];
solTwo = inv(matTwo) * coefTwo; 
d1 = solTwo(1);
d2 = solTwo(2);
tt = 0: 0.01:10;
ytt= (exp(alpha*tt)) .* (d1*cos(tt) + d2*sin(tt));
plot(tt, ytt, 'Color', 'Green', 'LineWidth', 1.25)
xlabel('t')
ylabel('y(t)')
hold off 
%% System Behavior
clear all;
clc;
close all;
% Two negative real roots
root1 = -1;
root = -3;
tt2= 0: 0.01:5;
ytt2 = 2*exp(-3*tt2) - exp(-tt2);
subplot(2,2, 1)
plot(tt2, ytt2, 'Color', 'Cyan', 'LineWidth', 1.25)
grid on 
xlabel('t')
ylabel('y(t)')
title('Two negative real roots')
subplot(2,2,2) 
%Two positive real roots
rootPos1 = 3;
rootPos2 = 1; 
ytt3 = 2* exp(3*tt2) - exp(tt2);
plot(tt2, ytt3, 'Color', 'Green', 'LineWidth', 1.25)
grid on
xlabel('t')
ylabel ('y(t)')
title('Two positive real roots')
%One negative, and one positive root
fey2 = -1;
fey = 3;
yf = 2*exp(3*tt2) - exp(-tt2);
subplot(2, 2, 3)
plot(tt2, yf, 'Color', 'Red', 'LineWidth', 1.25)
grid on
xlabel('t')
ylabel('y(t)')
title('Negative + Positive')
% Complex conjugate roots of the form -alpha +- beta*i
ytm = 2*exp(-tt2) .* cos(10*tt2);
subplot(2, 2, 4)
plot(tt2, ytm, 'Color', 'Magenta', 'LineWidth', 1.25)
grid on 



