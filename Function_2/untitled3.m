%Disprove of ISS property matlab code
[t, x] = ode45(@rtheta, [0 100], [5;5;0;0]);  %initial state is set in advance
figure(1); %plot the state variables
subplot(4,1,1);
plot(t,x(:,1),'r','linewidth',2);
hold on
subplot(4,1,2);
plot(t,x(:,2),'r','linewidth',2);
subplot(4,1,3);
plot(t,x(:,3),'b','linewidth',2);
subplot(4,1,4);
plot(t,x(:,4),'b','linewidth',2);
% function of the four dimensional system;
function dx = rtheta(t, x)
    %Calculate the Lyapunov function V(x) for the current state, without
    %using the current thetad
    V = 0.5 * ((x(2)^2 + 1) * (x(3))^2) + 0.5 * (x(4))^2 + 0.5 * (x(1))^2 + 0.5 * (x(2))^2;
    % update thetad
    c = 200; % constant which could be modified 
    thetad = c * sign(V); % using V(x) for the representaion of thetad
    % setting rd as constant 0 
    rd = 0;
    % calculation of state derivatives
    denominator = (x(2))^2 + 1 ;
    dx = [x(3);
          x(4);
          (-2 * x(2) * x(3) * x(4) - x(3) - (x(1) - thetad)) / denominator;
          (x(3))^2 * x(2) - x(4) - (x(2) - rd)];
end