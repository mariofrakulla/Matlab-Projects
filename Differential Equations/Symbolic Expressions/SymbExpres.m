a = 1;
b = 6;
c = 9;
syms r;
fprintf('This is the auxiliary equation: ')
equation = a*r^2 + b*r + c
solEq = roots([1 6 9])
% The system is going to be stable, because the real part of the
% complex
% roots is negative. The shape of the equation will not vary
% sinusoidally
% as the imaginary part is 0

%%
IC = [-2; 3];
tSpan = 0:0.01:4;
[tOut, yOut] = ode45(@weekFive, tSpan, IC);
subplot(2,2,1)
plot(tSpan, yOut(:,1), 'Color','Blue','LineWidth',1.25)
title('y(t) vs. t')
grid on
xlabel('t')
ylabel('y(t)')
subplot(2,2,3)
plot(tSpan, yOut(:,2), 'Color','Black','LineWidth',1.25)
grid on
title('dy(t)/dt vs. t')
xlabel('t')
ylabel('y''(t)')
subplot(2,2,[2 4])
plot(yOut(:,2), yOut(:,1), 'Color','Red','LineWidth',1.25)
grid on
title('Phase Plot ode45')
xlabel('x2')
ylabel('x1')
%%
syms y(t)
y = dsolve('D2y + 6*Dy + 9*y == 0, Dy(0) == 3') ;
yprime = diff(y, 1);
matlabFunction(y, 'file', 'yt')
matlabFunction(yprime, 'file' , 'dydt')
t =[0: 0.01: 4];
figure(3)
plot(t, yt(1,t), 'Color','Red', 'LineWidth', 1.25)
grid on
hold on
plot(t, dydt(1,t),'Color','Black', 'LineWidth', 1.25)
title('Analytical Solution')
xlabel('t')
legend('yt', 'dy/dt')

figure(4)
title('Analytic solution vs. Numerical Solution')
subplot(2,2,1)
plot(tSpan, yOut(:,1), 'Color','Blue','LineWidth',1.25)
hold on
plot(t, yt(1,t), 'Color','Red', 'LineWidth', 1.25)
legend('Numerical Solution', 'Analytic Solution')
grid on
title('Comparison y')
xlabel('t')
ylabel('y(t)')
%b
subplot(2,2,3)
plot(tSpan, yOut(:,2), 'Color','Blue','LineWidth',1.25)
hold on
plot(t, dydt(1,t), 'Color','Red', 'LineWidth', 1.25)
legend('Numerical Solution', 'Analytic Solution')

title('Comparison dy/dt')
grid on
xlabel('t')
ylabel('y''(t)')
%The graphs obtained using the analytical and numerical solutions are
%similar but not the same, as the numerical solution always
% incorporates error
subplot(2,2,[2 4])
plot(t, yt(1,t), 'Color','Green', 'LineWidth', 1.25)
hold on
title('Phase Plot')
plot(t, dydt(1,t), 'Color','Cyan', 'LineWidth', 1.25)
grid on
legend('yt','dydt')