function plotfg(f)
m = numel(f(1, :));
if m == 2
    plot(f(:, 1), f(:, 2), 'bo', 'MarkerSize', 5);
    xlabel('f_1');
    ylabel('f_2');
elseif m == 3
    scatter3(f(:, 1), f(:, 2), f(:, 3), 'bo');
    xlabel('f_1');
    ylabel('f_2');
    zlabel('f_3');
end
drawnow;
end