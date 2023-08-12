% Parameters
a = 0.25;
b = 0.1;
c = 10.0;

% Time settings
dt = 0.01;
T = 1000;
num_steps = T / dt;

% Initial conditions
x0 = 1.0;
y0 = 0.0;
z0 = 0.0;

% Initialize arrays to store trajectory
x = zeros(num_steps, 1);
y = zeros(num_steps, 1);
z = zeros(num_steps, 1);

% Initialize the first point of the trajectory
x(1) = x0;
y(1) = y0;
z(1) = z0;

% Simulation loop
for i = 1:num_steps-1
    dx = -y(i) - z(i);
    dy = x(i) + a*y(i);
    dz = b + z(i)*(x(i) - c);
    
    x(i+1) = x(i) + dx * dt;
    y(i+1) = y(i) + dy * dt;
    z(i+1) = z(i) + dz * dt;
end

% Plotting
figure;
plot3(x, y, z, 'LineWidth', 1.0);
title('Complex 3D Rössler Attractor');
xlabel('x');
ylabel('y');
zlabel('z');
grid on;
view([-30,20]);

% Save the plot as a PNG file
filename = 'Rossler.png';  % Output file name
saveas(gcf, filename);  % Save the current plot as a PNG file
disp(['Plot saved as ', filename]);
