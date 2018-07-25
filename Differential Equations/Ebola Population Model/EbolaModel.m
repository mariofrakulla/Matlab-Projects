% Author: Mario Frakulla 
type diffex
type ebola
%% Euler's Method (Step 10)
dt = 10;
yI = 3/15000;
tI = 0;
tEnd = 500;
tSpan = tI:dt:tEnd;
y = zeros(size(tSpan));
y(1) = yI;
for i=2:length(tSpan)
yprime = diffex(tSpan(i-1),y(i-1));
y(i) = y(i-1) + dt*yprime;
end
figure(1)
plot(tSpan,y, 'Color', 'Blue', 'LineWidth', 1.25)
hold on
grid on
fprintf('Half of Population is infected when t = 250 hrs, using Eulers Method with a 10-hr increment\n') 
%% Euler's Method (Step 5)
dt2 = 5;
yI2 = 3/15000;
tI2 = 0;
tEnd2 = 500;
tSpan2 = tI2:dt2:tEnd2;
y2 = zeros(size(tSpan2));
y2(1) = yI2;
for j=2:length(tSpan2)
    yprime2 = diffex(tSpan2(j-1),y2(j-1));
    y2(j) = y2(j-1) + dt2*yprime2;
end
plot(tSpan2,y2, 'Color' ,'Red', 'LineWidth', 1.25 )
fprintf('Half of Population is infected when t = 225 hrs, using Eulers Method with a 5-hr increment\n') 
%% Euler's Method (Step 1)
dt3 = 1;
yI3 = 3/15000;
tI3 = 0;
tEnd3 = 500;
tSpan3 = tI3:dt3:tEnd3;
y3 = zeros(size(tSpan3));
y3(1) = yI3;

for h=2:length(tSpan3)
    yprime3 = diffex(tSpan3(h-1),y3(h-1));
    y3(h) = y3(h-1) + dt3*yprime3;
end
plot(tSpan3,y3, 'Color' ,'Green', 'LineWidth', 1.25 )
fprintf('Half of Population is infected when t = 215 hrs, using Eulers Method with a 1-hr increment') 
%% Runge Kutta 2nd Method
dtRk = 5;
tRk= 0: dtRk: 500; 
lengthRk = length(tRk);
kn1 = zeros(1, lengthRk); 
kn2 = zeros(1, lengthRk);
yRk = zeros(1, lengthRk); 
yRk ( 1) = 3/15000;

for m = 2: lengthRk
    kn1(m) = diffex(tRk(m-1), yRk(m-1));
    kn2(m) = diffex(tRk(m-1) + 2.5, yRk(m-1)+(2.5*kn1(m)));
    yRk(m) = yRk(m-1) + dtRk*kn2(m-1);
end 
plot(tRk, yRk, 'Color' , 'Black', 'LineWidth', 1.25)
fprintf('\nHalf of Population is infected when t = 215 hrs, using the Runge-Kutta 2nd Order Method ') 
%% ODE 45
tStart1= 0;
tEnd1= 500;
yI1 = 3/15000;
[t_out, y_out] = ebola(tStart1, tEnd1,yI1);
plot(t_out, y_out,'Color', 'Magenta', 'LineWidth', 1.25)
fprintf('\nHalf of Population is infected when t = 215 hrs, using ODE45()') 
hold off
xlabel( 'time(hours)')
ylabel('fraction of population infected')
legend('Euler Step Size 10 hrs', 'Euler Step Size 5 hrs','Euler Step Size 1 hrs', 'Runge-Kutta 2nd Order', 'ODE45')
%% Analytical Solution
timeSol = 0:5:500;
diffEqSol =(( exp(0.04*timeSol))./((exp(0.04*timeSol))+ 4999));
error1 =immse(diffEqSol, y2) % error Euler Step Size 5
error2 = immse(diffEqSol, yRk) % error Runge-Kutta 2nd Order, Step Size 5
error3 = immse(diffEqSol, y_out') %error ODE45()

%% Part 5 
%Based on the above solutions and graphs, we can conclude that the used
%methods approximate the solutions of ODE to different with different
%accuracies. The most accurate approximation method was ODE45(), as this
%method resulted in the lowest MSE value. Euler's Method and  Runge-Kutta 2nd order 
%were good approximations, but resulted in greater errors compared to ODE45


