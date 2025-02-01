function f = MMF8(X)
temp = X(:, 2) <= 4;
y = zeros(size(X, 1), 1);
y(temp) = X(temp, 2) - sin(abs(X(temp, 1))) - abs(X(temp, 1));
y(~temp) = X(~temp, 2) - 4 - sin(abs(X(~temp, 1))) - abs(X(~temp, 1));
f(:, 1) = sin(abs(X(:, 1)));
f(:, 2) = sqrt(1-f(:, 1).^2) + 2 * y.^2;
end
