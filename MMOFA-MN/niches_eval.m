function elite = niches_eval(niches, nEl,d,m)

elite = cat(1, niches.elite);

[FrontNo, ~] = NDSorting(elite, numel(elite(:, 1)));

elite = elite(FrontNo == 1, :);

if numel(elite(:, 1)) > nEl
    elite = update_elite_odist(elite, nEl, d, m, 2);
end


end