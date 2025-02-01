function ShowClusterA(niches, flag)
% flag==1 种群个体  flag==2 精英个体
k_class = numel(niches);

[~, d] = size(niches(1).position);

lineStyles = linspecer(k_class);
figure;
% clf;
hold on;
for i = 1:k_class

    if flag == 1
        Class = niches(i).position;
    else
        Class = niches(i).elite(:, 1:d);
    end

    center = niches(i).center;

    if (~isempty(Class))
        %此时绘制第i类的点，且按照lineStyle的第i+1行中的颜色绘制%
        if d == 3
            scatter3(Class(:, 1), Class(:, 2), Class(:, 3), 'MarkerFaceColor', lineStyles(i, :), 'MarkerEdgeColor', lineStyles(i, :));
            scatter3(center(1, 1), center(1, 2), center(1, 3), 'p', 'MarkerFaceColor', 'none', 'MarkerEdgeColor', lineStyles(i, :), 'SizeData', 150);
        elseif d == 2
            scatter(Class(:, 1), Class(:, 2), 'MarkerFaceColor', lineStyles(i, :), 'MarkerEdgeColor', lineStyles(i, :));
            scatter(center(1, 1), center(1, 2), 'p', 'MarkerFaceColor', 'none', 'MarkerEdgeColor', lineStyles(i, :), 'SizeData', 150);
            if niches(i).R ~= inf
                plotbound(center, niches(i).R, d, lineStyles(i, :));
            end
        end
    end
end
hold off;
end