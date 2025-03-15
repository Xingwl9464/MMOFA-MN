function w = assign_Weight(num)
weight = unifrnd(-1, 1, [1, num]); %生成权重
sum_w = sum(weight);
w = weight / sum_w;
end