% example code for OCTAVE
%
% Author: Ivan Lee
% Date: 2025.02.02

if exist('OCTAVE_VERSION')
    % if running OCTAVE instead of MATLAB
    pkg load statistics
end

addpath('DataSet')
addpath('DataSet/MMF')
addpath('DataSet/Omni_test')
addpath('DataSet/SYM_PART')
addpath('MMOFA-MN')

% run single problem / test-function
%   param1: time
%   param2: n, nEL
%   param3: tMax
%   param4: problem / test-function
mofa_new(1, 200, 200, 'MMF1')

% note: for executing all demos, uncomment the next line
%automatic
