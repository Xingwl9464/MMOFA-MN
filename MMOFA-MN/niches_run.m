function [niches, t] = niches_run(input, parameter, t, max_evaluate)

%位置
position = input.position;
%适应值
cost = input.cost;
%精英解
elite = input.elite;
%簇心
center = input.center;
%半径
R = input.R;
%评估水平
SCD = input.SCD;

Problem = parameter.Problem; % 测试问题
beta0 = parameter.beta0; % 初始吸引度
gamma = parameter.gamma; % 衰减系数
alpha = parameter.alpha; % 步长初始因子
delta = parameter.delta; % 缩放因子
mu = parameter.mu; % 变异率
Ub = parameter.Ub; % 上界
Lb = parameter.Lb; % 下界
m = parameter.m; % 目标数
d = parameter.d; % 决策空间维度
n = numel(position(:, 1)); % 种群个数

% 权重获取当前最好解
[g_position, ~] = get_gbest(position, cost);

% 获取精英解
[d_position, ~] = select_dbest(elite, SCD, d, m);

for i = 1:n

    % 计时器 count==0 代表此个体没有被支配过
    count = 0;
    for j = i:n
        % 计算欧式距离
        rij = sqrt(sum((position(i, :) - position(j, :)).^2));
        rid = sqrt(sum((position(i, :) - d_position).^2));
        % 计算吸引度
        beta1 = beta0 * exp(-gamma*rij.^2);
        beta2 = beta0 * exp(-gamma*rid.^2);
        % 生成扰动项
        steps = delta .* ones(1, d) * (rand - 0.5) * 2;

        if cost(j, 1:m) <= cost(i, 1:m)
            w = assign_Weight(2);
            % 萤火虫移动
            % position(i, :) = position(i, :) + beta1 * (position(j, :) - position(i, :)) + alpha * steps;
            position(i, :) = position(i, :) + w(1) * beta1 * (position(j, :) - position(i, :)) + w(2) * beta2 * (d_position - position(i, :)) + alpha * steps;
            count = count + 1;
        end

        if count == 0
            w = assign_Weight(2);
            % 萤火虫随机移动
            position(i, :) = w(1) * d_position(1, :) + w(2) * g_position(1, :) + alpha * steps;
        end

        % 越界处理
        position(i, :) = simplebounds(position(i, :), Lb, Ub, center, R); %保证萤火虫i移动的位置在范围内

        % 重新评估适应值
        cost(i, 1:m) = obj_funs(position(i, 1:d), Problem); %重新计算亮度（也就是把解带入到函数中求出函数值）

        % 变异
        if rand < mu

            mu_position = position(i, :);

            mu_index = randi(d);
            % 变异
            mu_position(1, mu_index) = mu_position(1, mu_index) + 0.1 * tan(pi * (rand - 0.5)) * (Ub(mu_index) - Lb(mu_index));

            % 越界处理
            mu_position(1, :) = simplebounds(mu_position(1, :), Lb, Ub, center, R);
            % 重新评估适应值
            mu_cost = obj_funs(mu_position(1, :), Problem);

            if mu_cost(1, 1:m) <= cost(i, 1:m)
                position(i, :) = mu_position(1, :);
                cost(i, 1:m) = mu_cost(1, 1:m);
            elseif mu_cost(1, 1:m) > cost(i, 1:m)
            else
                position(i, :) = mu_position(1, :);
                cost(i, 1:m) = mu_cost(1, 1:m);
            end % end if mu_cost(1, 1:m) <= cost(i, 1:m)
        end % end if rand < mu

    end % end for j
    t = t + 1;
    if t >= max_evaluate
        break;
    end
end % end for i

% 合并成种群
all_pop = [position, cost];
elite = [all_pop; elite];

[FrontNo, ~] = NDSorting(elite(:, d+1:d+m), numel(elite(:, 1)));
elite = elite(FrontNo==1,:);

% 特殊拥挤距离
[~, ~, SCD] = non_domination_scd_sort(elite, numel(elite(:, 1)), d, m);

if numel(elite(:, 1)) >= n
    niches.isMaturity = 1;
else
    niches.isMaturity = 0;
end

niches.position = position;
niches.cost = cost;
niches.elite = elite;
niches.center = center;
niches.R = R;
niches.SCD = SCD;
end