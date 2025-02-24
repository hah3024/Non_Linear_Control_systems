function simulatePendulum()
    k_values = [0, 1];
    initial_conditions = [3; 0]; % Initial condition [theta; angular velocity]

    for k = k_values
        tspan = [0, 50]; % Simulation time
        [t, x] = ode23(@(t, x) pendulumDynamics(x, k), tspan, initial_conditions);
        
        % Plot results
        figure;
        plot(t, x(:, 1), 'b', 'DisplayName', 'Theta (x_1)');
        hold on;
        plot(t, x(:, 2), 'r', 'DisplayName', 'Angular Velocity (x_2)');
        title(['Pendulum Simulation for $k = ', num2str(k), '$'], 'Interpreter', 'latex');
        xlabel('Time (s)', 'Interpreter', 'latex');
        ylabel('State Variables', 'Interpreter', 'latex');
        legend({'$\theta$ ($x_1$)', 'Angular Velocity ($x_2$)'}, 'Interpreter', 'latex');
        grid on;

    end
end

function dxdt = pendulumDynamics(x, k)
    dxdt = zeros(2, 1); % Initialize the output
    dxdt(1) = x(2); % dx1/dt = x2
    dxdt(2) = -k * x(2) - sin(x(1)); % dx2/dt = -k*x2 - sin(x1)
end

