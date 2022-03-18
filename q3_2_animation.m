clear
clc
close all
global w1 w2 w3;

z0 = [1.7319, 0.659, 0.464]; % Initial conditions
tspan = [0,10]; % Time range
[t,z] = ode45('q3_2', tspan, z0); % Integrate and solve for the angles

%% Define the angles
phi_1 = z(:,1);
phi_2 = z(:,2);
phi_3 = z(:,3);

%% Animation of the robot in Body two - 1-2-1 sequence
% Assumption: The robot is rectangluar with initial orientation given as:
% (0,0,2), (0,3,2), (5,3,2), (5,0,2)
for k = 1:length(phi_1)
    clf
    
    % Calculate new coordinates
    x = [0 -3*cos(phi_1(k))*sin(phi_3(k)) 5*cos(phi_2(k))*cos(phi_3(k))-3*cos(phi_1(k))*sin(phi_3(k)) 5*cos(phi_2(k))*cos(phi_3(k)) 0];
    y = [0 3*cos(phi_1(k))*cos(phi_3(k)) 3*cos(phi_1(k))*cos(phi_3(k))+5*cos(phi_2(k))*sin(phi_3(k)) 5*cos(phi_2(k))*sin(phi_3(k)) 0];
    z = [2 2+3*sin(phi_1(k)) 2+3*sin(phi_1(k))+5*sin(phi_2(k)) 2+5*sin(phi_2(k)) 2];
    
    % Animate the robot in Body two - 1-2-1 sequence
    plot3(x,y,z)
    axis([-10 10 -10 10 -10 10])
    hold on
    grid on
    
    
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title(['phi_1 = ', num2str(phi_1(k)),' phi_2 = ', num2str(phi_2(k)), ' phi_3 = ', num2str(phi_3(k)), '   (radians)'])
    pause(0.2)
%     movieVector(k) = getframe;
end

% myWriter = VideoWriter('Space Three - 1-2-3')
% myWriter.FrameRate = 10;
% 
% open(myWriter);
% writeVideo(myWriter, movieVector);
% close(myWriter);