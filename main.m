% example code for OCTAVE
%
% Author: Ivan Lee
% Date: 2025.02.02

if exist('OCTAVE_VERSION')
    % if running OCTAVE instead of MATLAB
    pkg load statistics
end

% Retrieve the directory where the current script is located
currentDir = pwd;

if ispc % Windows
    separator = ';';
else % Linux or Mac
    separator = ':';
end

% Add DataSet folder and its subfolders to MATLAB work path
paths = strsplit(path, separator);  % 使用正确的分隔符
datasetPath = fullfile(currentDir, 'DataSet');
if ~ismember(datasetPath, paths)
    addpath(genpath(datasetPath));
end

% Add MMOFA-MN folder and its subfolders to MATLAB work path
mmofaMnPath = fullfile(currentDir, 'MMOFA-MN');
if ~ismember(mmofaMnPath, paths)
    addpath(genpath(mmofaMnPath));
end

% Optional: Save the current path settings so that they remain valid the next time MATLAB is launched
% savepath;

% run single problem / test-function
%   param1: time     / When running the same test function independently, record the current number of times
%   param2: n        / Population size
%   param3: nEL      / Maximum external file capacity
%   param4: tMax     / Maximum Number Of Iterations
%   param5: problem  / Test-function 
mofa_new(1, 200, 200, 200, 'MMF2')

% The running results are stored in a mat file, 
% named in the format of 
% "Problem" _ "time" _ "n" _ "tMax". mat


% If you want to modify the control parameter n, 
% you can open the mofa_new. m file 
% and modify the parameter pn



