%%%
theta_d = 1; r_d = 2;
x0 = [0, 0, 0, 0]; % 初始状态
[t, x] = ode45(@(t, x) system_dynamics(t, x, pd_controller2(x, theta_d, r_d)), [0 50], x0);
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
function dx = system_dynamics(t, x, u)
    % 定义微分方程
    % 假设 u = [u1; u2] 是控制输入，x = [x1; x2; x3; x4] 是状态
    dx = [
        x(3);                    % x1 的导数是 x3
        x(4);                    % x2 的导数是 x4
        (u(1) - 2*x(4)*x(2)*x(3)) / (x(2)^2 + 1);  % x3 的导数
        (u(2) + x(2)*x(3)^2);    % x4 的导数
    ]; % 确保这里用 ';' 拼接
end

% function u = pd_controller(x, theta_d, r_d)
%     % 定义 PD 控制器
%     u1 = -x(3) - (x(1) - theta_d); % 控制输入 u1
%     u2 = -x(4) - (x(2) - r_d);     % 控制输入 u2
%     u = [u1; u2]; % 确保返回列向量
% end

function u = pd_controller2(x, theta_d, r_d)
    % 定义 PD 控制器
    u1 = -x(3) - (x(1) - theta_d); % 控制输入 u1
    u2 = -x(4) - (x(2) - r_d)-(x(2)^2-r_d^2);     % 控制输入 u2
    u = [u1; u2]; % 确保返回列向量
end
%%
