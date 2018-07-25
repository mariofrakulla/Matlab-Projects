type diff_example;
%Initialize Variables
dt1 = 0.5;
yI = 1;
tI = 0;
tEnd = 10;
% Define time points and solution vector
tSpan = tI:dt1:tEnd;
y = zeros(size(tSpan));
%Initialize the solution at the initial conditions
y(1) = yI;
% Implement Euler's method
for i=2:length(tSpan)
yprime = diff_example(tSpan(i-1),y(i-1));
y(i) = y(i-1) + dt1*yprime;
end
%Plot Solutions
figure(1)
plot(tSpan,y, 'Color', 'Blue', 'LineWidth', 1.25)
grid on
xlabel('Time')
ylabel('y(t)')
hold on
%% EULER'S METHOD (t = 0.2)
%Initialize Variables
dt = 0.2;
yI = 1;
tI = 0;
tEnd = 10;
%Define time points and solution vector
tSpan = tI:dt:tEnd;
y2 = zeros(size(tSpan));
%Initialize the solution at the initial conditions
y2(1) = yI;
%Implement Euler's method
for i=2:length(tSpan)
yprime = diff_example(tSpan(i-1),y2(i-1));
y2(i) = y2(i-1) + dt*yprime;
end
%Plot Solutions
plot(tSpan,y2, 'Color', 'Red', 'LineWidth' , 1.25)
grid on
xlabel('Time')
ylabel('y(t)')
%% ODE45 (t = 0.2)
tStart = 0;
tEnd = 10;
[t_out, y_out] = ode45(@diff_example,[tStart tEnd], yI);
plot(t_out, y_out,'Color', 'Green', 'LineWidth', 1.25)

%% ANALYTICAL SOLUTION
t = 0:0.1:10;
sol = 3 - (6./(exp(t) + 2));
plot(t, sol, 'Color', 'Black','LineWidth', 0.5)
legend('Euler''s Method dt =0.5', 'Euler''s Method dt =0.2', 'ODE45 dt= 0.2',...
    'Analytical Solution')
y_out = y_out';
err1 = immse(y,sol(1:length(y))) %Euler 0.5
err2 = immse(y2,sol(1:length(y2))) %Euler 0.2
err3 = immse(y_out, sol(1:45)) %ODE45