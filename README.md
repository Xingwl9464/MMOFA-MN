# Thank you for reading

The file is divided into two parts: dataSet and MMOFA-MN

# DataSet

The dataset contains expressions for three testing functions: MMF, Omni_test, and SYM-PART, as well as calculation formulas for PF, PS, HV, IGDx, IGD, and PSP. The rest of the files are designed in a factory mode. By entering Problem, you can obtain the corresponding PS PF、 Expressions and graphs.



# MMOFA-MN

The MMOFA-MN folder contains the core code of the algorithm。



# Code execution

If you want to run the code, you can click on the main file, you will see this code.

mofa_new(1, 200, 200, 200, 'MMF2')

% run single problem / test-function
%   param1: time     / When running the same test function independently, record the current number of times
%   param2: n        / Population size
%   param3: nEL      / Maximum external file capacity
%   param4: tMax     / Maximum Number Of Iterations
%   param5: problem  / Test-function 



# Code execution result

When you run the main file, you will get two files. 

The vargin file is a temporary running file used to temporarily store some parameters, which is not important.

The other file is the running result. Its naming format  of "Problem" _ "time" _ "n" _ "tMax". mat



# Control parameter n

If you want to modify the control parameter n, you can open the mofa_new. m file and modify the parameter pn
