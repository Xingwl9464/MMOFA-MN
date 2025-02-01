function fk = cal_density(position, cost)

k = 3;
% 决策空间比重 0-1
w = 0.5;

% 个体数量
n = numel(position(:, 1));

if n == 1
    fk = 1;
elseif n == 2
    fk = [0.5, 0.5];
else
    if n <= k
        k = n - 1;
    end
    % 计算决策空间的密度xitak_dec和总密度sum_dec
    [xitak_dec, sum_dec] = cal_xitak(position, k);
    % 计算决策空间的密度xitak_obj和总密度sum_obj
    [xitak_obj, sum_obj] = cal_xitak(cost, k);
    % 计算fk
    fk = w * (sum_dec / xitak_dec) + (1 - w) * (sum_obj / xitak_obj);

end
fk = fk';
end


function [xitak, k_sum] = cal_xitak(input, k)
% 计算距离矩阵
Distance = pdist2(input, input);
% 对角线设置为inf
Distance(logical(eye(length(Distance)))) = inf;
% 升序排序
dist = sort(Distance);
% 获取前k行
dist = dist(1:k, :);
% 计算密度
k_sum = sum(dist, 1);
% 计算总密度
xitak = sum(k_sum);
end