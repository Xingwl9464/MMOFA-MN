function f = obj_funs(x, problem)
switch problem
    case 'ZDT1'
        f = ZDT1(x);
    case 'ZDT2'
        f = ZDT2(x);
    case 'ZDT3'
        f = ZDT3(x);
    case 'ZDT4'
        f = ZDT4(x);
    case 'ZDT6'
        f = ZDT6(x);
    case 'Viennet1'
        f = Viennet1(x);
    case 'Viennet2'
        f = Viennet2(x);
    case 'Viennet3'
        f = Viennet3(x);
    case 'DTLZ1'
        f = DTLZ1(x);
    case 'DTLZ2'
        f = DTLZ2(x);
    case 'DTLZ3'
        f = DTLZ3(x);
    case 'DTLZ4'
        f = DTLZ4(x);
    case 'DTLZ5'
        f = DTLZ5(x);
    case 'DTLZ6'
        f = DTLZ6(x);
    case 'DTLZ7'
        f = DTLZ7(x);
    case 'BT1'
        f = BT1(x);
    case 'BT2'
        f = BT2(x);
    case 'BT3'
        f = BT3(x);
    case 'BT4'
        f = BT4(x);
    case 'BT5'
        f = BT5(x);
    case 'BT6'
        f = BT6(x);
    case 'BT7'
        f = BT7(x);
    case 'BT8'
        f = BT8(x);
    case 'BT9'
        f = BT9(x);
    case 'IMOP1'
        f = IMOP1(x);
    case 'IMOP2'
        f = IMOP2(x);
    case 'IMOP3'
        f = IMOP3(x);
    case 'IMOP4'
        f = IMOP4(x);
    case 'IMOP5'
        f = IMOP5(x);
    case 'IMOP6'
        f = IMOP6(x);
    case 'IMOP7'
        f = IMOP7(x);
    case 'IMOP8'
        f = IMOP8(x);
    case 'WFG1'
        f = WFG1(x);
    case 'WFG2'
        f = WFG2(x);
    case 'WFG3'
        f = WFG3(x);
    case 'WFG4'
        f = WFG4(x);
    case 'WFG5'
        f = WFG5(x);
    case 'WFG6'
        f = WFG6(x);
    case 'WFG7'
        f = WFG7(x);
    case 'WFG8'
        f = WFG8(x);
    case 'WFG9'
        f = WFG9(x);
    case 'LSMOP1'
        f = LSMOP1(x);
    case 'LSMOP2'
        f = LSMOP2(x);
    case 'LSMOP3'
        f = LSMOP3(x);
    case 'LSMOP4'
        f = LSMOP4(x);
    case 'LSMOP5'
        f = LSMOP5(x);
    case 'LSMOP6'
        f = LSMOP6(x);
    case 'LSMOP7'
        f = LSMOP7(x);
    case 'LSMOP8'
        f = LSMOP8(x);
    case 'LSMOP9'
        f = LSMOP9(x);
    case 'MMF1'
        f = MMF1(x);
    case 'MMF1_e'
        f = MMF1_e(x);
    case 'MMF2'
        f = MMF2(x);
    case 'MMF3'
        f = MMF3(x);
    case 'MMF4'
        f = MMF4(x);
    case 'MMF5'
        f = MMF5(x);
    case 'MMF6'
        f = MMF6(x);
    case 'MMF7'
        f = MMF7(x);
    case 'MMF8'
        f = MMF8(x);
    case 'MMF10'
        f = MMF10(x);
    case 'MMF11'
        f = MMF11(x);
    case 'MMF12'
        f = MMF12(x);
    case 'MMF13'
        f = MMF13(x);
    case 'MMF14'
        f = MMF14(x);
    case 'MMF14_a'
        f = MMF14_a(x);
    case 'MMF15'
        f = MMF15(x);
    case 'MMF15_a'
        f = MMF15_a(x);
    case 'MMF16_l1'
        f = MMF16_l1(x);
    case 'MMF16_l2'
        f = MMF16_l2(x);
    case 'MMF16_l3'
        f = MMF16_l3(x);
    case 'MMMOP1A'
        f = MMMOP1A(x);
    case 'MMMOP2A'
        f = MMMOP2A(x);
    case 'MMMOP3A'
        f = MMMOP3A(x);
    case 'MMMOP4A'
        f = MMMOP4A(x);
    case 'MMMOP5A'
        f = MMMOP5A(x);
    case 'MMMOP6A'
        f = MMMOP6A(x);
    case 'Omni_test'
        f = Omni_test(x);
    case 'SYM_PART_simple'
        f = SYM_PART_simple(x);
    case 'SYM_PART_rotated'
        f = SYM_PART_rotated(x);
    case 'IDMPM2T1'
        f = IDMPM2T1(x);
    case 'IDMPM2T2'
        f = IDMPM2T2(x);
    case 'IDMPM2T3'
        f = IDMPM2T3(x);
    case 'IDMPM2T4'
        f = IDMPM2T4(x);
    case 'IDMPM3T1'
        f = IDMPM3T1(x);
    case 'IDMPM3T2'
        f = IDMPM3T2(x);
    case 'IDMPM3T3'
        f = IDMPM3T3(x);
    case 'IDMPM3T4'
        f = IDMPM3T4(x);
    case 'MAP'
        f = map(x);

end
end