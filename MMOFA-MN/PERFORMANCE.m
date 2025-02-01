clc;
clear;
close all;
format long;

suanfa_name = 'xwl_MOFA';
maxT = 3; %IGD运行次数
n = 200; % 种群大小
tMax = 100; % 迭代次数

% MMF  Omni_test MMMOPA SYM_PART_simple SYM_PART_rotated

Problem = 'IDMPM3T4'; % 测试函数
igd = zeros(maxT, 1);
hv = zeros(maxT, 1);
igdx = zeros(maxT, 1);
psp = zeros(maxT, 1);

for time = 1:maxT
    disp(['times is  ', num2str(time)])
    mofa_new(time, n, tMax, Problem);
    load_name = strcat(Problem, '_', num2str(time), '_', num2str(n), '_', num2str(tMax), '.mat');
    load(load_name);
    igd(time) = per_igd;
    hv(time) = per_hv;
    igdx(time) = per_igdx;
    psp(time) = per_psp;
    disp(['IGD=', num2str(igd(time))]);
    disp(['HV=', num2str(hv(time))]);
    disp(['IGDX=', num2str(igdx(time))]);
    disp(['PSP=', num2str(psp(time))]);
end
igd_mean = mean(igd);
igd_std = std(igd, 1);
hv_mean = mean(hv);
hv_std = std(hv, 1);
igdx_mean = mean(igdx);
igdx_std = std(igdx, 1);
psp_mean = mean(psp);
psp_std = std(psp, 1);
disp(['Mean of IGD= ', num2str(igd_mean), ': Std of IGD= ', num2str(igd_std)]);
disp(['Mean of HV= ', num2str(hv_mean), ': Std of HV= ', num2str(hv_std)]);
disp(['Mean of IGDX= ', num2str(igdx_mean), ': Std of IGDX= ', num2str(igdx_std)]);
disp(['Mean of PSP= ', num2str(psp_mean), ': Std of PSP= ', num2str(psp_std)]);

save_name = strcat(Problem, '_', suanfa_name, '_means', '.mat');
save(save_name);
