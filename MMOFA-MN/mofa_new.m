function mofa_new(varargin)
save vargin.mat;
close all;
clear;
clc;
load vargin.mat; %#ok<*LOAD>
persistent time;
persistent n;
persistent tMax;
persistent nEl;
persistent Problem;
if isempty(varargin)
    time = 1; %算法运行次数
    n = 200; %种群数量
    tMax = 100; %最大迭代次数
    nEl = 200; %精英解最大容量
    %  MMF  SYM_PART_simple  SYM_PART_rotated IDMPM2T1
    Problem = 'MMF13';
else
    time = varargin{1};
    n = varargin{2};
    tMax = varargin{3};
    nEl = varargin{2};
    Problem = varargin{4};
end
% 加载问题
file__name = strcat(Problem, '.mat');

% 获取对应问题的 m目标个数 d决策变量维度 ub上界 lb下界
[m, d, Ub, Lb] = problemCase(Problem); % 默认参数
% [m, d, Ub, Lb] = parameterSet(Problem,3,4); %手动设置参数

% 设置小生境内运行参数
parameter.Problem = Problem;
parameter.Ub = Ub; % 上界
parameter.Lb = Lb; % 下界
parameter.n = n; % 种群数
parameter.m = m; % 目标数
parameter.d = d; % 决策空间维度
parameter.beta0 = 1.0; % 初始吸引度
parameter.gamma = 1.0; % 衰减系数
parameter.alpha = 0.25; % 步长初始因子
parameter.delta = 1.0 * (Ub - Lb); % 缩放因子
parameter.mu = 0.1; % 变异率

% 种群初始化
position = 0 * ones(n, d); % 存放萤火虫的位置 因为是n个萤火虫，搜索维度是d
cost = 0 * ones(n, m); % 存放函数值 因为是n个萤火虫m个目标函数 第一列是第一个目标函数的值 第二列是第二个目标函数的值
for i = 1:n
    position(i, :) = Lb + (Ub - Lb) .* rand(1, d); %生成1行d列区间在(Lb,Ub)的随机数
    cost(i, 1:m) = obj_funs(position(i, :), Problem); %通过m个目标函数计算出m个对应的值 f矩阵中的第一行
end

t = 0;
max_evaluate = n * tMax;


% 小生境初始化
niches = niches_init(position, cost);

time1 = clock;
while t <= max_evaluate

    for i = 1:numel(niches(:,1))
        [niches(i), t] = niches_run(niches(i), parameter, t, max_evaluate);
    end

    if ismerge(niches) == 1
        elite = niches_eval(niches, nEl,d,m);
        niches = niches_init(elite(:,1:d), elite(:,d+1:d+m));
    end
    disp([strcat('测试函数:', Problem), strcat('##算法运行次数:', num2str(time)), strcat('##Iterations t=', num2str(t), '/', num2str(max_evaluate))]);

end

time2 = clock;
disp(['time is:', num2str(etime(time2, time1))]);
load(file__name);

elite = cat(1, niches.elite);
% 计算IGD
per_igd = IGD(elite(:, d+1:d+m), PF);
disp(['igd is:', num2str(per_igd)]);

per_hv = HV(elite(:, d+1:d+m), PF);
disp(['hv is:', num2str(per_hv)]);

% 计算IGDX
per_igdx = IGDX(elite(:, 1:d), PS);
disp(['igdx is:', num2str(per_igdx)]);

% 计算PSP
per_psp = PSP(PS,elite(:, 1:d), per_igdx);
disp(['psp is:', num2str(per_psp)]);
disp(['1/psp is:', num2str(1/per_psp)]);
% 画目标空间
plotfg(elite(:, d+1:d+m));
hold on;
plotPareto(Problem);
hold off;

% 画决策空间
figure;
plotPS(Problem);
hold on;
plotfg(elite(:, 1:d));

%文件保存
save_name = strcat(Problem, '_', num2str(time), '_', num2str(n), '_', num2str(tMax), '.mat');
save(save_name);