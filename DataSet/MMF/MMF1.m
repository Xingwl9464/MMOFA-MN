function f = MMF1(X)
f(:, 1) = abs(X(:, 1)-2);
f(:, 2) = 1 - sqrt(f(:, 1)) + 2 * (X(:, 2) - sin(6*pi*f(:, 1)+pi)).^2;
end
