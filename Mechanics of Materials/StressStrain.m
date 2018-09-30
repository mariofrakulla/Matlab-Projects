% MEM230 (Stress - Strain Problem)
loads = [1000, 2000, 6000, 10000, 12000, 12900, ...
              13400, 13600, 13800, 14000, 14400, 15200,...
               16800, 18400, 20000, 22400]; % lb
enlongation = [0.0002, 0.0006, 0.0019, ...
                       0.0033, 0.0039, 0.0043, ...
                       0.0047, 0.0054, 0.0063, ...
                       0.0090, 0.0102, 0.0130, ...
                       0.0230, 0.0336, 0.0507, 0.2208];
figure(3)
plot(enlongation, loads, 'Color', 'Red', 'LineWidth', 1.2)
grid on
xlabel('Enlongation(in.)');
ylabel('Load(lb)');
                 
initdiam = 0.505;
initgage = 2 ;
fingag = 0.12;
fdiam = 0.42;
initArea = (3.14/4) * (initdiam^2);
stress = (loads./initArea)./1000;
strain = enlongation./initgage;
figure(5)
plot(strain, stress, 'Color', 'Blue', 'LineWidth', 1.25);
grid on
xlabel('Strain');
ylabel('Stress (ksi)');             
Ymodulus = round((stress(2) - stress(1))/(strain(2)  - strain(1)),2);
text(0.5, 0.5, horzcat('E = ',num2str(Ymodulus)), 'units', 'normalized');
                 