function elite = update_elite_odist(input, nEl, d, m, flag)

% 去重
[~, ind] = unique(input(:, d+1:d+m), 'rows', 'stable');
input = input(ind, :);

% 非支配排序
input = NDsort(input(:, 1:d+m), m, d);

% 获取非支配解
elite_index = (input(:, d+m+1) == 1) == 1;
elite = input(elite_index, :);

% 计算外部档案的个体个数
elite_num = numel(elite(:, 1));

if elite_num > nEl

    % 欧式距离关系矩阵
    odist_matrix = zeros(elite_num, elite_num);

    %获取适应值
    if flag == 1
        cost = elite(:, d+1:d+m);
    else
        cost = elite(:, 1:d);
    end


    % 最小欧氏距离 优化时间复杂度
    min_odist = zeros(2, elite_num);

    % 开始计算欧氏距离
    for i = 1:elite_num
        for j = i:elite_num

            % 计算欧式距离
            value = pdist([cost(i, :); cost(j, :)], 'euclidean');
            odist_matrix(i, j) = value;
            odist_matrix(j, i) = value;
            % 自身和自身的关系是0 但是为了找到最小 0为影响实验数据 因此设置为inf
            if i == j
                odist_matrix(i, j) = inf;
            end
        end
        % 记录最小欧式距离的个体  个体下标i和个体min_odist(2, i)的欧式距离是min_odist(1, i)
        [min_odist(1, i), min_odist(2, i)] = min(odist_matrix(:, i));
    end

    % 逻辑向量
    choose = ones(1, elite_num);

    num = elite_num;

    % 开始维护
    while num > nEl


        for i = 1:elite_num
            if choose(min_odist(2, i)) == 0
                [min_odist(1, i), min_odist(2, i)] = min(odist_matrix(:, i));
            end
        end

        % 找到最小的两个个体mini和minj和他们之间的欧氏距离
        [~, mini] = min(min_odist(1, :));
        minj = min_odist(2, mini);

        % 找到这两个个体分别和其他个体的距离
        alli = odist_matrix(:, mini);
        allj = odist_matrix(:, minj);

        % 排序
        alli = sort(alli);
        allj = sort(allj);

        % 开始比较 谁最先开始小 认为谁拥挤
        for index = 1:elite_num
            if alli(index) < allj(index)
                odist_matrix(mini, :) = inf; % 删除行
                odist_matrix(:, mini) = inf; % 删除列
                min_odist(1, mini) = inf; % 删除在min_odist的信息
                choose(mini) = 0; % 逻辑设为0
                num = num - 1; % 个体数减1
                break;
            elseif alli(index) > allj(index)
                odist_matrix(minj, :) = inf;
                odist_matrix(:, minj) = inf;
                min_odist(1, minj) = inf;
                choose(minj) = 0;
                num = num - 1;
                break;
            end
            if index == elite_num
                odist_matrix(mini, :) = inf; % 删除行
                odist_matrix(:, mini) = inf; % 删除列
                min_odist(1, mini) = inf; % 删除在min_odist的信息
                choose(mini) = 0; % 逻辑设为0
                num = num - 1; % 个体数减1
                break;
            end
        end


    end
    elite = elite((choose == 1), :); % 获取逻辑
end


elite = elite(:, 1:d+m+1);
end
