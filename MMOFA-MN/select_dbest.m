function [d_position, d_cost] = select_dbest(elite, BUG, d, m)


index = RouletteWheelSelection(1,1./BUG);

d_position = elite(index, 1:d);

d_cost = elite(index, d+1:d+m);


end


function index = RouletteWheelSelection(N, Fitness)
%适应值越小 越能选中
Fitness = reshape(Fitness, 1, []);
Fitness = Fitness - min(min(Fitness), 0) + 1e-6;
Fitness = cumsum(1./Fitness);
Fitness = Fitness ./ max(Fitness);
index = arrayfun(@(S)find(rand <= Fitness, 1), 1:N);
end