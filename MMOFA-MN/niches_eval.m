function temp = niches_eval(niches, nEl, d, m)
temp = cat(1, niches.elite);
pop = cat(1, niches.position);
cost = cat(1, niches.cost);
temp = [temp; [pop, cost]];
[FrontNo, ~] = NDSorting(temp, numel(temp(:, 1)));
temp = temp(FrontNo == 1, :);
if numel(temp(:, 1)) > nEl
    temp = update_elite_odist(temp, nEl, d, m, 2);
end
end