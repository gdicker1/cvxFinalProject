%{ 
main.m
Main file for cvxFinalProject

Sets up experiement and calls other functions
%}
% seed rng
rng('default');
% Experiment defining variables
numRooms = 10;
numUsers = 10;
numHours = 24;
numFans = 3*numRooms;
numAC = numRooms;
numComp = 100;

%% Power levels
power_comp = 171; % Consumes 171Wh active (actual computer would have some percentage low power)
power_fan = 200;
power_ac = 400;

% Vectors / Matrices to define experiment

