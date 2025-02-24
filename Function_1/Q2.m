%%
% Define the parameters for the equation
sigma_values = [0]; % Example different sigma values
initial_conditions = [1, 1, 1]; % Initial conditions
% Time span
tspan = [0 35];

% Loop through different sigma values
for i = 1:length(sigma_values)
    sigma = sigma_values(i);
    
    % Define the system of differential equations
    dxdt = @(t, x) [
        sigma * (x(2) - x(1));
        28 * x(1) - x(2) - x(1) * x(3);
        x(1) * x(2) - 8/3 * x(3)
    ];
    
    % Solve the differential equations
    [t, x] = ode23(dxdt, tspan, initial_conditions);
    
    % Calculate the vector field for quiver3 (dx, dy, dz)
    dx = sigma * (x(:,2) - x(:,1));
    dy = 28 * x(:,1) - x(:,2) - x(:,1) .* x(:,3);
    dz = x(:,1) .* x(:,2) - 8/3 * x(:,3);
    
    % Display the final x values at the last time step
    fprintf('For sigma = %d, final x = [%f, %f, %f]\n', sigma, x(end, 1), x(end, 2), x(end, 3));
    
    % Plot the vector field with quiver3
    figure;
    % Select every 5th data point to reduce density
    quiver3(x(1:5:end,1), x(1:5:end,2), x(1:5:end,3), dx(1:5:end), dy(1:5:end), dz(1:5:end), 1, 'LineWidth', 2, 'Color', 'r', "AutoScale", "off");
    
    % Plot the 3D trajectory
    hold on;
    plot3(x(:,1), x(:,2), x(:,3), 'b', 'LineWidth', 0.5);
    
    % Mark the starting point (initial condition)
    scatter3(x(1,1), x(1,2), x(1,3), 20, 'filled', 'MarkerEdgeColor','k', 'MarkerFaceColor','g'); % Green for start
    text(x(1,1), x(1,2), x(1,3), sprintf('  (%.2f, %.2f, %.2f)', x(1,1), x(1,2), x(1,3)), 'FontSize', 12, 'Color', 'b');
    
    % Mark the final point (last value)
    scatter3(x(end,1), x(end,2), x(end,3), 20, 'filled', 'MarkerEdgeColor','k', 'MarkerFaceColor','r'); % Red for end
    text(x(end,1), x(end,2), x(end,3), sprintf('  (%.2f, %.2f, %.2f)', x(end,1), x(end,2), x(end,3)), 'FontSize', 12, 'Color', 'black');
    
    % Title and labels
    title(sprintf('3D Trajectory and Vector Field for $\\sigma = %d$', sigma), 'Interpreter', 'latex');
    xlabel('$x_1$', 'Interpreter', 'latex');
    ylabel('$x_2$', 'Interpreter', 'latex');
    zlabel('$x_3$', 'Interpreter', 'latex');
    grid on;
    hold off;
end









