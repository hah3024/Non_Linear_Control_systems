function dx = pendulum(t, x, k)
    dx = zeros(2, 1);
    dx(1) = x(2);
    dx(2) = -k * x(2) - sin(x(1));
end
