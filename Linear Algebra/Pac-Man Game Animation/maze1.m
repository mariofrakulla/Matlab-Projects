
%% define pacman
xcoords = [0 1 2 3 2   3 2 1 0];
ycoords = [2 1 1 2 2.5 3 4 4 3];
pacman = [xcoords;ycoords;ones(1,length(xcoords))]; % homogeneous coordinates
% note pacman's centeroid is 1.5 in x and 2.5 in y
%% Display Pacman
figure(10)
fill(xcoords,ycoords,'r')
axis([0 5 0 5])
grid on; axis equal; hold on
title('my pacman for ENGR231  note center is 1.5, 2.5 wrt 0,0')

%%   define maze 
% create a new figure for maze ans subsequent work
close all
figure(777)

% outer edges
mm = [[0;0], [25;0], [25;25], [0;25], [0;10], [15;10], [15;15], [5;15], [5;20]];
mazey1 = [[0;0], [0;5]] % vertical at end
% inner closure
mazex2= [[0;5], [20;5], [20;20], [5;20]];

plot(mm(1,:),mm(2,:),'k','linewidth',3)
hold on
plot(mazex2(1,:),mazex2(2,:),'k','linewidth',3)
plot(mazey1(1,:), mazey1(2,:), 'k','linewidth', 3)
%axis([-5, 30, -5, 30])
grid on; 
title('pacman maze')
%%  show final destination
plot(14,12.5, 'k*', 'linewidth', 5)
%%  Move Pacman about the maze
% note the use of pause shows an animation if you run the completed file

% starting postion
pac0 = trans(0,0)*pacman;  % no translation
fill(pac0(1,:),pac0(2,:),'r')
pause(0.1)
%move 12 units to right with no rotation
pac1= trans(12,0)*trans(1.5,2.5)*rot(0)*trans(-1.5,-2.5)*pacman; 
fill(pac1(1,:),pac1(2,:),'b')
pause(0.1)
% move to 21,0 put mouth facing up
% first move center of pacman to (0,0) rotate 90 degrees CW move back to
% (1.5,2.5) then translate 21 in x referenced from the starting position
pac2 = trans(21,0)*trans(1.5,2.5)*rot(90)*trans(-1.5,-2.5)*pacman;
fill(pac2(1,:),pac2(2,:),'g')
pause(1)
%%
pacc = trans(24,25) * rot(180);
pac3 = pacc * pacman;
fill(pac3(1,:), pac3(2, :), 'c') 
pause(1)

 pac4 = trans(1, 24)*rot(90)*trans(-24, -24)* pac3;
 fill(pac4(1,:), pac4(2,:), 'k')
 pause(1) 
 
 pac5 = trans(1, 12)*rot(90)*trans(-2,-24)* pac4; 
 fill(pac5(1,:), pac5(2,:), 'g')
 pause(1) 
 
 pac6 = trans(10,0)* pac5; 
 fill(pac6(1,:), pac6(2,:), 'c')
 pause(1) 
 
 
  
 
 







