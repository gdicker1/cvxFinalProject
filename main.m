%{ 
main.m
Main file for cvxFinalProject

Sets up experiement and calls other functions
%}
clear; clc;
% seed rng
rng('default');
% Experiment defining variables
numUsers = int16(30);
numRooms = int16(10);
numHours = int16(24);
numFans = int16(3*numRooms);
numAC = int16(numRooms);
numComp = int16(100);

%% Power levels
power_comp = 171; % Consumes 171Wh active (actual computer would have some percentage low power)
power_fan = 200;
power_ac = 400;

% Vectors & Matrices to define experiment
[O, U, F, A, C] = expr_setup(numUsers, numRooms, numHours, numFans, numAC, numComp);

