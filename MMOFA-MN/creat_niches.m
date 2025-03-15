function niches = creat_niches(niches, num_niches, pop, d, m, elite)

position = pop(:, 1:d); %获取位置
cost = pop(:, d+1:d+m); %获取适应值
n = numel(position(:, 1)); %获取种群大小

% 如果小生境个数为1
if num_niches == 1
    niches(1).elite = elite;
    niches(1).position = position;
    niches(1).cost = cost;
    [~, ~, niches(1).BUG] = non_domination_scd_sort(elite, numel(elite(:, 1)), d, m);
    niches(1).isMaturity = 0;
    niches(1).center = zeros(1, d);
    niches(1).R = inf;
else
    % k-means聚类
    [group, center] = kmeans(elite(:, 1:d), num_niches);
    for i = 1:num_niches
        % 小生境内精英解赋值
        niches(i).elite = elite(group == i, :);

        %小生境内精英个体数量
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
        [~, ~, niches(i).BUG] = non_domination_scd_sort(niches(i).elite, num_niches_elite, d, m);

        niches(i).isMaturity = 0;

    end % end for


    % 存放种群划分
    pop_group = zeros(n, 1);

    % 存放距离
    od = zeros(n, 1);

    % 遍历种群
    for i = 1:n
        % 存放个体距离每个簇心的距离
        k_dist = zeros(num_niches, 1);
        for j = 1:num_niches
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
    for i = 1:num_niches
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

end %end if num_niches == 1

end