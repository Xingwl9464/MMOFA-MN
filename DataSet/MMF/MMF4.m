function f = MMF4(X)
temp = X(:, 2) < 1;
y = zeros(size(X, 1), 1);
y(temp) = X(temp, 2) - sin(pi*abs(X(temp, 1)));
y(~temp) = X(~temp, 2) - 1 - sin(pi*abs(X(~temp, 1)));
f(:, 1) = abs(X(:, 1));
f(:, 2) = 1 - X(:, 1).^2 + 2 * y.^2;
end
