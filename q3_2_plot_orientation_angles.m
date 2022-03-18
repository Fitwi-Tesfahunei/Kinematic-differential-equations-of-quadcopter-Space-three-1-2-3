clc
clear
close all
global w1 w2 w3;

z0 = [1.7319, 0.659, 0.464]; % Initial conditions
tspan = [0,10]; % Time range
[t,z] = ode45('q3_2', tspan, z0); % Integrate and solve for the angles

%% Define the angles
phi_1 = z(:,1);
phi_2 = z(:,2);
phi_3 = z(:,3);

%% Plot the orientation angles
plot(t,phi_1,t,phi_2,t,phi_3)
legend('Phi_1','Phi_2','Phi_3')
xlabel('Time (sec)')
ylabel('Phi (rad)')
title('Orientation Angles (Space Three 1-2-3)')
grid on