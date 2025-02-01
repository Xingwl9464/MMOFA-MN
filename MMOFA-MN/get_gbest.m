function [g_position, g_cost] = get_gbest(position, cost)

[n, m] = size(cost);

% 获取当前最好解（权重）
w = assign_Weight(m);

g_position = position(1, :);
g_cost = cost(1, :);

for i = 2:n
    if w * g_cost' > w * cost(i, :)'
        g_position = position(i, :);
        g_cost = cost(i, :);
    end
end
end