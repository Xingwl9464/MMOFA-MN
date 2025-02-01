function f = MMF1_e(X)
% 1<=x1<=3    -a^3<=x2<=a^3

a = 0.5;

f(:, 1) = abs(X(:, 1)-2);
if X(:, 1) < 2
    f(:, 2) = 1 - sqrt(f(:, 1)) + 2 * (X(:, 2) - sin(6*pi*f(:, 1)+pi)).^2;
else
    t = a^X(1);
    f(:, 2) = 1 - sqrt(f(:, 1)) + 2 * (X(:, 2) - t * sin(6*pi*f(:, 1)+pi)).^2;
end

end
