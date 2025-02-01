function f = MMF6(X)
temp = X(:, 2) <= 0 | X(:, 2) <= 1 & (X(:, 1) <= 7 / 6 | 8 / 6 < X(:, 1) & X(:, 1) <= 9 / 6 | 10 / 6 < X(:, 1) & X(:, 1) <= 11 / 6 | 13 / 6 < X(:, 1) & X(:, 1) <= 14 / 6 | 15 / 6 < X(:, 1) & X(:, 1) <= 16 / 6 | 17 / 6 < X(:, 1));
y = zeros(size(X, 1), 1);
y(temp) = X(temp, 2) - sin(6*pi*abs(X(temp, 1)-2)+pi);
y(~temp) = X(~temp, 2) - 1 - sin(6*pi*abs(X(~temp, 1)-2)+pi);
f(:, 1) = abs(X(:, 1)-2);
f(:, 2) = 1 - sqrt(f(:, 1)) + 2 * y.^2;
end
