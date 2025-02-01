function pop = NDsort(pop, m, d)
n = size(pop, 1); % 种群大小
frontRank = 1; % 计数 等级 排序用的
Rcol = d + m + 1; % 帕累托等级所在的列数
% 将Parato Front定义为一个类(PF)和xSol的初始化
PF(frontRank).R = [];
xSol.n = 0;% 被支配的数量(初始值为0)
xSol.q = [];% 找出所有的强支配解    并记录他们的下标

xSol = repmat(xSol,n,1);

for i = 1:n
    for j = 1:n
        % 定义3个计数器 第一个记录小于的次数 第二个记录等于的次数 第三个记录大于的次数
        ns_categ_1 = 0;
        ns_categ_2 = 0;
        ns_categ_3 = 0;
        for k = 1:m % 对于所有m个目标
            % 更新计数器
            if (pop(i, d+k) < pop(j, d+k)) % 小于
                ns_categ_1 = ns_categ_1 + 1;
            elseif (pop(i, d+k) == pop(j, d+k)) % 等于
                ns_categ_2 = ns_categ_2 + 1;
            else % 大于
                ns_categ_3 = ns_categ_3 + 1;
            end
        end % end of k
        % 更新类中的解
        % 如果第一个计时器等于0 第2个计数器不等于m 说明个体i被个体j支配了
        % 如果第三个计时器等于0 第2个计数器不等于m 说明个体i支配个体j
        if ns_categ_1 == 0 && ns_categ_2 ~= m
            xSol(i).n = xSol(i).n + 1;
            xSol(j).q = [xSol(j).q, i];
        elseif ns_categ_3 == 0 && ns_categ_2 ~= m
            xSol(j).n = xSol(j).n + 1;
            xSol(i).q = [xSol(i).q, j]; 
        end
    end % end of j
    % 更新帕累托等级 （一定至少有一个不会被其他个体支配）
    if xSol(i).n == 0  % 也就是说 没有其他萤火虫可以支配萤火虫i即萤火虫i就是强支配解
        pop(i, Rcol) = 1; % 并且把他们的等级赋予1
        PF(frontRank).R = [PF(frontRank).R, i];
    end
end % end i

% 更新帕累托等级2以后的个体
while ~isempty(PF(frontRank).R)
    nonPF = []; 
    N = length(PF(frontRank).R);
    for i = 1:N
        % 获取到非支配解的所有支配解的下标
        Sol_tmp_q = xSol(PF(frontRank).R(i)).q; 
        
        % 如果被支配的解的下标为空 说明不再支配任何解
        if ~isempty(xSol(Sol_tmp_q))
            for j = 1:length(Sol_tmp_q)
                
                Sol_tmp_qj = xSol(PF(frontRank).R(i)).q(j);
                
                % 就等于是移除了萤火虫i,那j的被支配数不就是减1嘛
                xSol(Sol_tmp_qj).n = xSol(Sol_tmp_qj).n - 1;
                % 如果等级为frontRank解还没遍历完，此时如果一个解的被支配数等于0了 
                if xSol(Sol_tmp_qj).n == 0
                    % 就说明这个解的帕累托等级就等于frontRank+1
                    pop(Sol_tmp_qj, Rcol) = frontRank + 1;
                    % 并且记录进入下一等级的萤火虫个体
                    nonPF = [nonPF, Sol_tmp_qj]; %#ok<AGROW>
                end
            end % end of j
        end
    end % end of i
    % 当所有等级为1的解移除完了（遍历）此时令frontRank+1 进入下一次迭代
    frontRank = frontRank + 1;
    % 获取下一等级的萤火虫个体
    PF(frontRank).R = nonPF;
end % end of PF(frontRank)

% 现在进行等级排序，然后更新
[~, frontRanks_Index] = sort(pop(:, Rcol));
pop = pop(frontRanks_Index, :);
end