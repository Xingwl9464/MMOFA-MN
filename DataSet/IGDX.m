function igdX = IGDX(position,PS)
    if size(position,2) ~= size(PS,2)
        igdX = nan;
    else
        igdX = mean(min(pdist2(PS,position),[],2));
    end
end