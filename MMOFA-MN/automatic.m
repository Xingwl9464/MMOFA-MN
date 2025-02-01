clc;
clear;
close all;
format long;

suanfa_name = 'MMOFA-MN';

ceshiji.Problem = [];
ceshiji.n = [];
ceshiji.tMax = [];
ceshiji.IGDmean = [];
ceshiji.IGDstd = [];
ceshiji.IGDALL = [];
ceshiji.HVmean = [];
ceshiji.HVstd = [];
ceshiji.HVALL = [];
ceshiji.IGDXmean = [];
ceshiji.IGDXstd = [];
ceshiji.IGDXALL = [];
ceshiji.PSPmean = [];
ceshiji.PSPstd = [];
ceshiji.PSPALL = [];


csj = repmat(ceshiji, 18, 1);

csj(1).Problem = 'MMF1';
csj(1).n = 200;
csj(1).tMax = 400;

csj(2).Problem = 'MMF1_e';
csj(2).n = 200;
csj(2).tMax = 400;

csj(3).Problem = 'MMF2';
csj(3).n = 200;
csj(3).tMax = 400;

csj(4).Problem = 'MMF3';
csj(4).n = 200;
csj(4).tMax = 400;

csj(5).Problem = 'MMF4';
csj(5).n = 200;
csj(5).tMax = 400;

csj(6).Problem = 'MMF5';
csj(6).n = 200;
csj(6).tMax = 400;

csj(7).Problem = 'MMF6';
csj(7).n = 200;
csj(7).tMax = 400;

csj(8).Problem = 'MMF7';
csj(8).n = 200;
csj(8).tMax = 400;

csj(9).Problem = 'MMF8';
csj(9).n = 200;
csj(9).tMax = 400;

csj(10).Problem = 'MMF10';
csj(10).n = 200;
csj(10).tMax = 400;

csj(11).Problem = 'MMF11';
csj(11).n = 200;
csj(11).tMax = 400;

csj(12).Problem = 'MMF12';
csj(12).n = 200;
csj(12).tMax = 400;

csj(13).Problem = 'MMF13';
csj(13).n = 200;
csj(13).tMax = 400;

csj(14).Problem = 'MMF14';
csj(14).n = 200;
csj(14).tMax = 400;

csj(15).Problem = 'MMF14_a';
csj(15).n = 200;
csj(15).tMax = 400;

csj(16).Problem = 'MMF15';
csj(16).n = 200;
csj(16).tMax = 400;

csj(17).Problem = 'MMF15_a';
csj(17).n = 200;
csj(17).tMax = 400;

csj(18).Problem = 'Omni_test';
csj(18).n = 200;
csj(18).tMax = 400;

csj(19).Problem = 'SYM_PART_simple';
csj(19).n = 200;
csj(19).tMax = 400;

csj(20).Problem = 'SYM_PART_rotated';
csj(20).n = 200;
csj(20).tMax = 400;



for all_index = 1:20
    
    maxT = 7; %运行次数

    Problem = csj(all_index).Problem;
    n = csj(all_index).n;
    tMax = csj(all_index).tMax;

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

    csj(all_index).IGDmean = igd_mean;
    csj(all_index).IGDstd = igd_std;
    csj(all_index).IGDALL = igd;

    csj(all_index).HVmean = hv_mean;
    csj(all_index).HVstd = hv_std;
    csj(all_index).HVALL = hv;

    csj(all_index).IGDXmean = igdx_mean;
    csj(all_index).IGDXstd = igdx_std;
    csj(all_index).IGDXALL = igdx;

    csj(all_index).PSPmean = psp_mean;
    csj(all_index).PSPstd = psp_std;
    csj(all_index).PSPALL = psp;


    disp(['Mean of IGD= ', num2str(igd_mean), ': Std of IGD= ', num2str(igd_std)]);
    disp(['Mean of HV= ', num2str(hv_mean), ': Std of HV= ', num2str(hv_std)]);
    disp(['Mean of IGDX= ', num2str(igdx_mean), ': Std of IGDX= ', num2str(igdx_std)]);
    disp(['Mean of PSP= ', num2str(psp_mean), ': Std of PSP= ', num2str(psp_std)]);

    save_name = strcat(Problem, '_', suanfa_name, '_means', '.mat');
    save(save_name);
end
all = [csj.IGDALL];
save all.mat