function result = problemDeter(Problem)
if strcmp(Problem, 'MMF1') || strcmp(Problem, 'MMF2') || strcmp(Problem, 'MMF3') || strcmp(Problem, 'MMF4') || strcmp(Problem, 'MMF5') || strcmp(Problem, 'MMF6') || strcmp(Problem, 'MMF7') || strcmp(Problem, 'MMF8')|| strcmp(Problem, 'Omni_test')|| strcmp(Problem, 'SYM_PART_simple')|| strcmp(Problem, 'SYM_PART_rotated')|| strcmp(Problem, 'MMMOP1A')|| strcmp(Problem, 'MMMOP2A')|| strcmp(Problem, 'MMMOP3A')|| strcmp(Problem, 'MMMOP4A')|| strcmp(Problem, 'MMMOP5A')|| strcmp(Problem, 'MMMOP6A')
    result = 1;
else
    result = 0;
end
end