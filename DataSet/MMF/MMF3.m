function f = MMF3(X)
temp = X(:, 2) <= 0.5 | X(:, 2) < 1 & X(:, 1) > 0.25;
y = zeros(size(X, 1), 1);
y(temp) = X(temp, 2) - sqrt(X(temp, 1));
y(~temp) = X(~temp, 2) - 0.5 - sqrt(X(~temp, 1));
f(:, 1) = X(:, 1);
f(:, 2) = 1 - sqrt(X(:, 1)) + 2 * (4 * y.^2 - 2 * cos(20*y*pi/sqrt(2)) + 2);
end
