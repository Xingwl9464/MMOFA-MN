function flag = ismerge(niches)
flag = 1;
for i = 1:numel(niches)
    if niches(i).isMaturity == 0
        flag = 0;
        break;
    end
end
end