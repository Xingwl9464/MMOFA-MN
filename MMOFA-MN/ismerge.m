function flag = ismerge(niches)
flag = 1;
for i = 1:numel(niches)
    [num_sa, ~] = size(niches(i).elite);
    [num_pop, ~] = size(niches(i).position);
    if num_sa >= num_pop
        flag = 0;
        return;
    end
end
end