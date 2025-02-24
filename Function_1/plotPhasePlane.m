%%
k = 0; % or set k = 1 for the second case
[t, x] = ode23(@(t, x) pendulum(t, x, k), [0, 30], [3; 0]); % initial condition [3; 0]
plot(x(:, 1), x(:, 2));
xlabel('$x_1 (\theta)$', 'Interpreter', 'latex');
ylabel('$x_2 (\dot{\theta})$', 'Interpreter', 'latex');
title('Phase-Plane Portrait of the Pendulum', 'Interpreter', 'latex');
function dx = pendulum(t, x, k)
    dx = zeros(2, 1);
    dx(1) = x(2);
    dx(2) = -k * x(2) - sin(x(1));
end
%%


