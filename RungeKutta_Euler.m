%Author: Mario Frakulla
%Date: 01/22/2018
%Euler Method vs. Runge-Kutta 2nd and 4th order methods
type odeExample
od = @odeExample;
%Euler Method for 0.25, and 0.1 increments
incrOne= 0.25; %incremental value (h)
incrTwo = 0.1; %incremental value two
t = 0 : 0.25: 5; %time range
len = length(t);
yEulerOne  = zeros(1,len);
yEulerOne(1) = 1; 
yEulerTwo = zeros(1,len);
yEulerTwo(1) = 1; 

for i = 2:len
    yEulerOne(i)  = yEulerOne( i-1 ) + incrOne * od( yEulerOne(i-1), t(i-1)); %definition of Euler's Method 
end 

for h = 2: len
    yEulerTwo(h) = yEulerTwo(h -1) + incrTwo * od(yEulerTwo(h-1), t(h-1));
end 
figure(1)
plot(t, yEulerOne, 'Color', 'Red', 'LineWidth', 1.25)
grid on
hold on
plot(t, yEulerTwo, 'Color', 'Blue', 'LineWidth', 1.35)
% Runge - Kuta (2nd Order)
kn1 = zeros(1,len);
kn2 = zeros(1,len); 
yRkOne = zeros(1, len); 
yRkOne(1) = 1; 
incr = 0.25;

for l  = 2:len 
    kn1(l) = od(yRkOne(l-1), t(l-1)); 
    kn2(l) = od(yRkOne(l-1) + ( incr/2) * kn1(l), t( l-1) + incr/2); 
    yRkOne(l)  = yRkOne(l-1) + incr * kn2(l-1); 
end 
plot(t, yRkOne, 'Color', 'Green', 'LineWidth', 1.25)
% Runge - Kuta (4th Order) 
kn11 = zeros(1, len);
kn22 = zeros(1, len);
kn3 = zeros(1, len); 
kn4 = zeros(1, len); 
yRkTwo = zeros(1, len);
yRkTwo(1) = 1;
for  j = 2: len
    kn11(j) = od(yRkTwo(j-1), t(j-1));
    kn22(j) = od(yRkTwo(j-1) + (incr/2) * kn11(j), t( j-1 ) + incr/2);
    kn3(j) = od(yRkTwo(j -1) + (incr/2) * kn22(j), t(j -1) + incr/2);
    kn4(j) = od((yRkTwo(j-1) + incr*kn3(j)), (t(j-1) + incr)) ;
    yRkTwo(j) = yRkTwo(j-1) + (incr/6)*((kn11(j)) + 2*kn22(j) + 2*kn3(j) + kn4(j));
end
plot(t, yRkTwo, 'Color', 'Black', 'LineWidth', 1.25)
hold off
legend('Euler Increment 0.25', 'Euler Increment 0.1', 'Runge-Kutta 2nd Order', 'Runge-Kutta 4th Order')
y = t + 2* exp(-t) -1;
errorOne = immse(y, yEulerOne)
errorTwo = immse(y, yEulerTwo)
errorThree =immse(y, yRkOne)
errorFour = immse(y, yRkTwo)


