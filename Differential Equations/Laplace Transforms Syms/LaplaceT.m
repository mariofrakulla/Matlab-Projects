% Laplace Transforms
syms s y t
y = (s+1)/((((s+1)^2) + 1)* (s^2 + s -6)) + (s+2)/(s^2+s-6)

tSpan = [0 4];
y = ilaplace(y)
x10 = 1;
x20 = 1;
x_0 = [x10; x20];
[t_out, y_out] = ode45(@diff_sys,tSpan,x_0);
subplot(2, 2, 1)
plot(t_out, y_out(:, 1), 'Color', 'Green', 'LineWidth', 1.25)
grid on
xlabel('t')
ylabel('y(t)')
title('y(t) vs. time')
subplot(2, 2, 3)
plot(t_out, y_out(:,2),'Color','Blue', 'LineWidth',1.25)
grid on
xlabel('t')
ylabel('y''(t)')
title('y''(t) vs. time')
subplot(2, 2, [2 4])
plot(y_out(:,1), y_out(:,2), 'Color', 'Black', 'LineWidth', 1.25)
grid on
xlabel('y(t)')
ylabel('y''(t)')
title('Phase Plot')
yprime = diff(y, 1);
matlabFunction(y, 'file', 'yt')
matlabFunction(yprime, 'file' , 'dydt');
tSpan = [0 4];
figure(3)
subplot(2,2,1)
plot(tSpan, yt(tSpan), 'Color','Red', 'LineWidth', 1.25)
title('y(t) vs. time')
xlabel('t')
ylabel('y(t)')
grid on
subplot(2,2,3)
plot(tSpan, dydt(tSpan),'Color','Black', 'LineWidth', 1.25)
grid on
title('y''(t) vs. time ')
xlabel('t')
ylabel('y''(t)')
subplot(2,2,[2 4])
plot(yt(tSpan), dydt(tSpan),'Color','Blue', 'LineWidth', 1.25)
grid on;

figure(7)
subplot(2,1,1)
plot(t_out, y_out(:, 1), 'Color', 'Green', 'LineWidth', 1.25)
xlabel('t')
ylabel('y(t)')
hold on
grid on

plot(tSpan, yt(tSpan), 'Color','Red', 'LineWidth', 1.25)
xlabel('t')
ylabel('y(t)')
title('Comparison Numerical and Analytical y(t) vs. t')
subplot(2,1,2)
plot(t_out, y_out(:,2),'Color','Blue', 'LineWidth',1.25)
xlabel('t')
ylabel('y''(t)')
hold on
grid on
plot(tSpan, dydt(tSpan),'Color','Black', 'LineWidth', 1.25)
xlabel('t')
ylabel('y''(t)')
title('Comparison Numerical and Analytical y''(t) vs. t')
