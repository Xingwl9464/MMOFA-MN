function y = MMF15_a(x, M, num_of_peak)

if nargin < 2
    M = 3;
end
if nargin < 3
    num_of_peak = 2;
end


t = (-0.5 * sin(pi*x(:, end-1)) + (x(:, end)));
g = 2 - exp(-2*log10(2).*((t + 1 / (2 * num_of_peak) - 0.1) / 0.8).^2) .* (sin(num_of_peak*pi.*(t + 1 / (2 * num_of_peak)))).^2;

y = repmat(1+g, 1, M) .* fliplr(cumprod([ones(size(g, 1), 1), cos(x(:, 1:M-1)*pi/2)], 2)) .* [ones(size(g, 1), 1), sin(x(:, M-1:-1:1)*pi/2)];

end
