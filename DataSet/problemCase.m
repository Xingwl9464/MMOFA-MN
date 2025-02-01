function [m, d, Ub, Lb] = problemCase(Problem)
% m 目标函数的个数
% d 自变量的维度，也就是未知数的个数
% Lower bounds/limits（下限）
% Upper bounds/limits（上限）

switch Problem
    case 'ZDT1'
        m = 2;
        d = 30;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'ZDT2'
        m = 2;
        d = 30;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'ZDT3'
        m = 2;
        d = 30;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'ZDT4'
        m = 2;
        d = 10;
        Lb = [0, zeros(1, d-1) - 5];
        Ub = [1, zeros(1, d-1) + 5];
    case 'ZDT6'
        m = 2;
        d = 10;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'Viennet1'
        m = 3;
        d = 2;
        Lb = [-2, -2];
        Ub = [2, 2];
    case 'Viennet2'
        m = 3;
        d = 2;
        Lb = [-4, -4];
        Ub = [4, 4];
    case 'Viennet3'
        m = 3;
        d = 2;
        Lb = [-3, -3];
        Ub = [3, 3];
    case 'DTLZ1'
        m = 3;
        d = 7;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'DTLZ2'
        m = 3;
        d = 12;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'DTLZ3'
        m = 3;
        d = 12;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'DTLZ4'
        m = 3;
        d = 12;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'DTLZ5'
        m = 3;
        d = 12;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'DTLZ6'
        m = 3;
        d = 12;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'DTLZ7'
        m = 3;
        d = 22;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'BT1'
        m = 2;
        d = 30;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'BT2'
        m = 2;
        d = 30;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'BT3'
        m = 2;
        d = 30;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'BT4'
        m = 2;
        d = 30;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'BT5'
        m = 2;
        d = 30;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'BT6'
        m = 2;
        d = 30;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'BT7'
        m = 2;
        d = 30;
        Lb = [0, -ones(1, d-1)];
        Ub = ones(1, d);
    case 'BT8'
        m = 2;
        d = 30;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'BT9'
        m = 3;
        d = 30;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'IMOP1'
        m = 2;
        d = 10;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'IMOP2'
        m = 2;
        d = 10;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'IMOP3'
        m = 2;
        d = 10;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'IMOP4'
        m = 3;
        d = 10;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'IMOP5'
        m = 3;
        d = 10;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'IMOP6'
        m = 3;
        d = 10;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'IMOP7'
        m = 3;
        d = 10;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'IMOP8'
        m = 3;
        d = 10;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'WFG1'
        m = 3;
        d = 12;
        Lb = zeros(1, d);
        Ub = 2:2:2 * d;
    case 'WFG2'
        m = 3;
        d = 12;
        Lb = zeros(1, d);
        Ub = 2:2:2 * d;
    case 'WFG3'
        m = 3;
        d = 12;
        Lb = zeros(1, d);
        Ub = 2:2:2 * d;
    case 'WFG4'
        m = 3;
        d = 12;
        Lb = zeros(1, d);
        Ub = 2:2:2 * d;
    case 'WFG5'
        m = 3;
        d = 12;
        Lb = zeros(1, d);
        Ub = 2:2:2 * d;
    case 'WFG6'
        m = 3;
        d = 12;
        Lb = zeros(1, d);
        Ub = 2:2:2 * d;
    case 'WFG7'
        m = 3;
        d = 12;
        Lb = zeros(1, d);
        Ub = 2:2:2 * d;
    case 'WFG8'
        m = 3;
        d = 12;
        Lb = zeros(1, d);
        Ub = 2:2:2 * d;
    case 'WFG9'
        m = 3;
        d = 12;
        Lb = zeros(1, d);
        Ub = 2:2:2 * d;
    case 'LSMOP1'
        m = 3;
        d = 300;
        Lb = zeros(1, d);
        Ub = [ones(1, m-1), 10 .* ones(1, d-m+1)];
    case 'LSMOP2'
        m = 3;
        d = 300;
        Lb = zeros(1, d);
        Ub = [ones(1, m-1), 10 .* ones(1, d-m+1)];
    case 'LSMOP3'
        m = 3;
        d = 300;
        Lb = zeros(1, d);
        Ub = [ones(1, m-1), 10 .* ones(1, d-m+1)];
    case 'LSMOP4'
        m = 3;
        d = 300;
        Lb = zeros(1, d);
        Ub = [ones(1, m-1), 10 .* ones(1, d-m+1)];
    case 'LSMOP5'
        m = 3;
        d = 300;
        Lb = zeros(1, d);
        Ub = [ones(1, m-1), 10 .* ones(1, d-m+1)];
    case 'LSMOP6'
        m = 3;
        d = 300;
        Lb = zeros(1, d);
        Ub = [ones(1, m-1), 10 .* ones(1, d-m+1)];
    case 'LSMOP7'
        m = 3;
        d = 300;
        Lb = zeros(1, d);
        Ub = [ones(1, m-1), 10 .* ones(1, d-m+1)];
    case 'LSMOP8'
        m = 3;
        d = 300;
        Lb = zeros(1, d);
        Ub = [ones(1, m-1), 10 .* ones(1, d-m+1)];
    case 'LSMOP9'
        m = 3;
        d = 300;
        Lb = zeros(1, d);
        Ub = [ones(1, m-1), 10 .* ones(1, d-m+1)];
    case 'MMF1'
        m = 2;
        d = 2;
        Lb = [1, -1];
        Ub = [3, 1];
    case 'MMF1_e'
        m = 2;
        d = 2;
        a = 1;
        Lb = [1, -a^3];
        Ub = [3, a^3];
    case 'MMF2'
        m = 2;
        d = 2;
        Lb = [0, 0];
        Ub = [1, 2];
    case 'MMF3'
        m = 2;
        d = 2;
        Lb = [0, 0];
        Ub = [1, 1.5];
    case 'MMF4'
        m = 2;
        d = 2;
        Lb = [-1, 0];
        Ub = [1, 2];
    case 'MMF5'
        m = 2;
        d = 2;
        Lb = [1, -1];
        Ub = [3, 3];
    case 'MMF6'
        m = 2;
        d = 2;
        Lb = [1, -1];
        Ub = [3, 2];
    case 'MMF7'
        m = 2;
        d = 2;
        Lb = [1, -1];
        Ub = [3, 1];
    case 'MMF8'
        m = 2;
        d = 2;
        Lb = [-pi, 0];
        Ub = [pi, 9];
    case 'MMF10'
        m = 2;
        d = 2;
        Lb = [0.1, 0.1];
        Ub = [1.1, 1.1];
    case 'MMF11'
        m = 2;
        d = 2;
        Lb = [0.1, 0.1];
        Ub = [1.1, 1.1];
    case 'MMF12'
        m = 2;
        d = 2;
        Lb = [0, 0];
        Ub = [1, 1];
    case 'MMF13'
        m = 2;
        d = 3;
        Lb = [0.1, 0.1, 0.1];
        Ub = [1.1, 1.1, 1.1];
    case 'MMF14'
        m = 3;
        d = 3;
        Lb = [0, 0, 0];
        Ub = [1, 1, 1];
    case 'MMF14_a'
        m = 3;
        d = 3;
        Lb = [0, 0, 0];
        Ub = [1, 1, 1];
    case 'MMF15'
        m = 3;
        d = 3;
        Lb = [0, 0, 0];
        Ub = [1, 1, 1];
    case 'MMF15_a'
        m = 3;
        d = 3;
        Lb = [0, 0, 0];
        Ub = [1, 1, 1];
    case 'MMF16_l1'
        m = 3;
        d = 3;
        Lb = [0, 0, 0];
        Ub = [1, 1, 1];
    case 'MMF16_l2'
        m = 3;
        d = 3;
        Lb = [0, 0, 0];
        Ub = [1, 1, 1];
    case 'MMF16_l3'
        m = 3;
        d = 3;
        Lb = [0, 0, 0];
        Ub = [1, 1, 1];
    case 'MMMOP1A'
        m = 2;
        d = 3;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'MMMOP2A'
        m = 2;
        d = 3;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'MMMOP3A'
        m = 2;
        d = 2;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'MMMOP4A'
        m = 2;
        d = 2;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'MMMOP5A'
        m = 2;
        d = 2;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'MMMOP6A'
        m = 2;
        d = 2;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'Omni_test'
        m = 2;
        d = 3;
        Lb = zeros(1, d);
        Ub = ones(1, d) * 6;
    case 'SYM_PART_simple'
        m = 2;
        d = 2;
        Lb = zeros(1, d) - 20;
        Ub = zeros(1, d) + 20;
    case 'SYM_PART_rotated'
        m = 2;
        d = 2;
        Lb = zeros(1, d) - 20;
        Ub = zeros(1, d) + 20;
    case 'IDMPM2T1'
        m = 2;
        d = 2;
        Lb = zeros(1, d) - 1;
        Ub = zeros(1, d) + 1;
    case 'IDMPM2T2'
        m = 2;
        d = 2;
        Lb = zeros(1, d) - 1;
        Ub = zeros(1, d) + 1;
    case 'IDMPM2T3'
        m = 2;
        d = 2;
        Lb = zeros(1, d) - 1;
        Ub = zeros(1, d) + 1;
    case 'IDMPM2T4'
        m = 2;
        d = 2;
        Lb = zeros(1, d) - 1;
        Ub = zeros(1, d) + 1;
    case 'IDMPM3T1'
        m = 3;
        d = 3;
        Lb = zeros(1, d) - 1;
        Ub = zeros(1, d) + 1;
    case 'IDMPM3T2'
        m = 3;
        d = 3;
        Lb = zeros(1, d) - 1;
        Ub = zeros(1, d) + 1;
    case 'IDMPM3T3'
        m = 3;
        d = 3;
        Lb = zeros(1, d) - 1;
        Ub = zeros(1, d) + 1;
    case 'IDMPM3T4'
        m = 3;
        d = 3;
        Lb = zeros(1, d) - 1;
        Ub = zeros(1, d) + 1;
    case 'UF1'
        m = 2;
        d = 30;
        Lb = [0, zeros(1, d) - 1];
        Ub = ones(1, d);
    case 'UF2'
        m = 2;
        d = 30;
        Lb = [0, zeros(1, d-1) - 1];
        Ub = ones(1, d);
    case 'UF3'
        m = 2;
        d = 30;
        Lb = zeros(1, d);
        Ub = ones(1, d);
    case 'UF4'
        m = 2;
        d = 30;
        Lb = [0, zeros(1, obj.D-1) - 2];
        Ub = [1, zeros(1, obj.D-1) + 2];
    case 'UF5'
        m = 2;
        d = 30;
        Lb = [0, zeros(1, d-1) - 1];
        Ub = ones(1, d);
    case 'UF6'
        m = 2;
        d = 30;
        Lb = [0, zeros(1, d-1) - 1];
        Ub = ones(1, d);
    case 'UF7'
        m = 2;
        d = 30;
        Lb = [0, zeros(1, d-1) - 1];
        Ub = ones(1, d);
    case 'MAP'
        m = 4;
        d = 2;
        Lb = [0, 0];
        Ub = [100, 100];
end
end