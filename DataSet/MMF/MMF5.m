function f = MMF5(X)
temp = X(:, 2) <= 1;
y = zeros(size(X, 1), 1);
y(temp) = X(temp, 2) - sin(6*pi*abs(X(temp, 1)-2)+pi);
y(~temp) = X(~temp, 2) - 2 - sin(6*pi*abs(X(~temp, 1)-2)+pi);
f(:, 1) = abs(X(:, 1)-2);
f(:, 2) = 1 - sqrt(f(:, 1)) + 2 * y.^2;
end
