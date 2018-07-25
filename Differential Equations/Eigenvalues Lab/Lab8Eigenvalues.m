%Case 1
A1 = [0 1;-3 -4];
[v1,d1] = eig(A1)
%Case 2
A2 = [0 1; -10 2];
[v2,d2] = eig(A2)
%Since the Eigenvalues are represented by matrices d1 and d2 we can predict
%the stability of the system based on their diagonal values signs
%First Case is Stable because both eigenvalues are negative
%Second Case is Unstable, because the real part of the complex conjugate
%roots is positive
%Case 1
lam_1 = d1(1,1);
lam_2 = d1(2,2);
v11 = v1(:,1);
v22 = v1(:,2);
v11= v11/min(v11);
v22 = v22/min(v22);
C = inv([v11 v22])*[2;-1];
c1 = C(1);
c2 = C(2);
%-2/5*e^-t -0.5*e^-3t
%Case 2
lam_3 = d2(1,1);
lam_4 = d2(2,2);
v21 = v2(:,1);
v2One = v2(:,2);
v21 = v21/min(v21);
v2One = v2One/min(v2One);
C2 = inv([v21 v2One]) *[2;-1];
c11 = C2(1);
c22 = C2(2);
%(1 +5i)*e^(1+3i)t + (1-5i)*e^(1-3i)t
time = 0:0.15:5;
x = c1*exp(lam_1*time).*v11(1) + c2*exp(lam_2*time).*v22(1);
x_p = c1*exp(lam_1*time).*v11(2) + c2*exp(lam_2*time).*v22(2);
x2 = c11*exp(lam_3*time).*v21(1) + c22*exp(lam_4*time).*v2One(1);
x2_p= c11*exp(lam_3*time).*v21(2) + c22*exp(lam_4*time).*v2One(2);
subplot(1,2,1)
plot(time,x, 'Color', 'Blue', 'LineWidth', 1.25)
hold on
plot(time,x2,'Color', 'Red', 'LineWidth', 1.25)
grid on
legend('Case I','Case II')
title('Component Plots')
xlabel('time')
ylabel('x(t)')
subplot(1,2,2)
plot(x,x_p,'Color', 'Blue', 'LineWidth', 1.25)
hold on
plot(x2,x2_p,'Color', 'Red', 'LineWidth', 1.25)
grid on
legend('Case I','Case II')
title('Phase Plots')
xlabel('x(t)')
ylabel('x_p(t)')
