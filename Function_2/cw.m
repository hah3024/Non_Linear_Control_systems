%Disprove of ISS property matlab code
x0 = [10, 5, 0, 0]
[t, x] = ode45(@system_dynamics1, [0 150], x0);  %initial state is set in advance
figure(1);
subplot(4,1,1);
plot(t, x(:, 1), 'r','linewidth',1); % 用红色表示 x1，蓝色表示 x2
xlabel('time $t$', 'Interpreter', 'latex');
ylabel('$\theta(t)$', 'Interpreter', 'latex');
legend('$\theta(t)$', 'Interpreter', 'latex'); % 添加图例区分曲线
subplot(4,1,2);
plot(t, x(:, 2), 'b','linewidth',1); % 用红色表示 x1，蓝色表示 x2
xlabel('time $t$', 'Interpreter', 'latex');
ylabel('$r(t)$', 'Interpreter', 'latex');
legend('$r(t)$', 'Interpreter', 'latex'); % 添加图例区分曲线
subplot(4,1,3);
plot(t, x(:, 3), 'r','linewidth',1); % 用红色表示 x1，蓝色表示 x2
xlabel('time $t$', 'Interpreter', 'latex');
ylabel('$\dot{\theta}(t)$', 'Interpreter', 'latex');
legend('$\dot{\theta}(t)$', 'Interpreter', 'latex'); % 添加图例区分曲线
subplot(4,1,4);
plot(t, x(:, 4), 'b','linewidth',1); % 用红色表示 x1，蓝色表示 x2
xlabel('time $t$', 'Interpreter', 'latex');
ylabel('$\dot{r}(t)$', 'Interpreter', 'latex');
legend('$\dot{r}(t)$', 'Interpreter', 'latex'); % 添加图例区分曲线
grid on; % 添加网格以提高可读性

% plot(t, x(:, 1), 'r'); % 用红色表示 x1，蓝色表示 x2
% xlabel('time $t$', 'Interpreter', 'latex');
% ylabel('$\theta(t)$', 'Interpreter', 'latex');
% legend('$\theta(t)$', 'Interpreter', 'latex'); % 添加图例区分曲线
% grid on; % 添加网格以提高可读性
% %%
% plot(t, x(:, 2), 'b'); % 用红色表示 x1，蓝色表示 x2
% xlabel('time $t$', 'Interpreter', 'latex');
% ylabel('$r(t)$', 'Interpreter', 'latex');
% legend('$r(t)$', 'Interpreter', 'latex'); % 添加图例区分曲线
% grid on; % 添加网格以提高可读性
% %%
% plot(t, x(:, 3), 'r'); % 用红色表示 x1，蓝色表示 x2
% xlabel('time $t$', 'Interpreter', 'latex');
% ylabel('$\dot{\theta}(t)$', 'Interpreter', 'latex');
% legend('$\dot{\theta}(t)$', 'Interpreter', 'latex'); % 添加图例区分曲线
% grid on; % 添加网格以提高可读性
% %%
% plot(t, x(:, 4), 'b'); % 用红色表示 x1，蓝色表示 x2
% xlabel('time $t$', 'Interpreter', 'latex');
% ylabel('$\dot{r}(t)$', 'Interpreter', 'latex');
% legend('$\dot{r}(t)$', 'Interpreter', 'latex'); % 添加图例区分曲线
% grid on; % 添加网格以提高可读性

% function of the four dimensional system;
function dx = system_dynamics1(t, x)
    %Calculate the Lyapunov function V(x) for the current state, without
    V = 0.5 * ((x(2)^2 + 1) * (x(3))^2) + 0.5 * (x(4))^2 + 0.5 * (x(1))^2 + 0.5 * (x(2))^2;
    % update thetad
    c = 100; % constant which could be modified 
    theta_d = c * sign(V); % using V(x) for the representaion of thetad
    % setting rd as constant 0 
    rd = 0;
    % calculation of state derivatives
    denominator = (x(2))^2 + 1 ;
    dx = [x(3);
          x(4);
          (-2 * x(2) * x(3) * x(4) -x(3) - (x(1) - theta_d)) / denominator;
          (x(3))^2 * x(2) - x(4) - (x(2) - rd)];
end