function result = isStandard(niches)
result = 1;
num_niches = numel(niches(:, 1));

for i = 1:num_niches
    if isempty(niches(i).position)
        result = 0;
        break;
    end
end

end