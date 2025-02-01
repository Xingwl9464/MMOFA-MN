function niches = niches_init(position, cost)
pn = 4;

[n, d] = size(position);

[~, m] = size(cost);

[FrontNo, ~] = NDSorting(cost, n);

non_position = position(FrontNo == 1, :);
non_cost = cost(FrontNo == 1, :);

elite = [non_position, non_cost];

[en, ~] = size(elite);

k = ceil(sqrt(en)/pn);

%小生境参数
niche.position = [];
niche.cost = [];
niche.elite = [];
niche.center = [];
niche.R = [];
niche.SCD = [];
niche.isMaturity = [];

niches = repmat(niche, [k, 1]);


if k == 1
    niches(1).position = position;
    niches(1).cost = cost;
    niches(1).elite = elite;
    niches(1).R = inf;
    [~, ~, niches(1).SCD] = non_domination_scd_sort(niches(1).elite, n, d, m);
    niches(1).isMaturity = 0;
else
    % k-means聚类
    [group, center] = kmeans(non_position, k);

    for i = 1:k
        niches(i).elite = elite(group == i, :);

        num_niches_elite = numel(niches(i).elite(:, 1));

        % 精英个体到簇心的距离
        zDist = zeros(num_niches_elite, 1);
        % 小生境境心赋值
        for j = 1:num_niches_elite
            zDist(j) = sqrt(sum((niches(i).elite(j, 1:d) - center(i, :)).^2));
        end
        % 获取作为境心的精英个体下标
        [~, center_index] = min(zDist);

        % 设置小生境境心
        niches(i).center = niches(i).elite(center_index, 1:d);

        % 计算特殊拥挤距离
        [~, ~, niches(i).SCD] = non_domination_scd_sort(niches(i).elite, num_niches_elite, d, m);

        niches(i).isMaturity = 0;
    end


    % 存放种群划分
    pop_group = zeros(n, 1);

    % 存放距离
    od = zeros(n, 1);

    % 遍历种群
    for i = 1:n
        % 存放个体距离每个簇心的距离
        k_dist = zeros(k, 1);
        for j = 1:k
            %计算萤火虫i与每个簇心的欧式距离
            k_dist(j) = sqrt(sum((position(i, :) - niches(j).center(1, :)).^2));
        end
        %将萤火虫划分到距离最近的小生境
        [od(i), pop_group(i)] = min(k_dist);
    end % end for

    % 合并所有境心
    center_center = cat(1, niches.center);
    % 计算所有境心的距离
    Distance = pdist2(center_center, center_center);
    % 对角线设置成无穷大
    Distance(logical(eye(length(Distance)))) = inf;

    % 遍历各小生境
    for i = 1:k
        % 获取位置
        niches(i).position = position(pop_group == i, :);

        % 获取亮度
        niches(i).cost = cost(pop_group == i, :);

        % 小生境间最近簇心最近的距离划为半径
        % niches(i).R = min(Distance(:, i));

        % 小生境内最远的距离划为半径
        % niches(i).R = max(od(pop_group == i));

        % 小生境间最近簇心最近距离和小生境内最远距离做比较 谁大 谁作为半径
        niches(i).R = max(max(od(pop_group == i)), min(Distance(:, i)));

    end % end for


end


end