%{ 
main.m
Main file for cvxFinalProject

Sets up experiement and calls other functions
%}


clear; clc;
% seed rng
rng('default');
% Experiment defining variables
numRooms = 10
numHours = 24
numFans = 3*numRooms
numAC = numRooms
numComp = 20*numRooms
numUsers = 0.95 * numComp

% Power levels
power_comp = 200; % Consumes 171Wh active (actual computer would have some percentage low power)
power_fan = 100;
power_ac = 400;
ELIM = 500000; % Lim is 220kWh of energy

% Vectors & Matrices to define experiment
[O, U, F, A, C] = expr_setup(numUsers, numRooms, numHours, numFans, numAC, numComp)
OccByHour = O*U'; % Number of users in each lab every hour
hOnesVec = ones(numHours,1);
uOnesVec = ones(numUsers,1);

fprintf('---Starting CVX with pF=100W pAC=400W pC=400W ELIM=500000---\n')
cvx_begin
    variables X_f(numRooms, numHours) X_a(numRooms, numHours)
    
    maximize(F'*sum((X_f.^0.5).*OccByHour, 2)+2*A'*sum((X_a.^0.8).*OccByHour, 2))
    subject to
    power_fan * F' * X_f * hOnesVec + ...
        power_ac * A' * X_a * hOnesVec + ...
        power_comp * hOnesVec' * U * uOnesVec <= ELIM
    X_f <= 1
    X_f >= 0
    X_a <= 1
    X_a >= 0
        
cvx_end


eF = power_fan * F' * X_f * hOnesVec
eA = power_ac * A' * X_a * hOnesVec
eC = power_comp * hOnesVec' * U * uOnesVec
EDIS = eF + eA + eC
X_f
csvwrite('xf0.csv', X_f);
X_a
csvwrite('xa0.csv', X_a);
fprintf('X_a < X_f\n')
X_a < X_f
numALessF = sum(sum(X_a < X_f))
fprintf('---End with pF=100W pAC=400W pC=400W ELIM=500000---\n\n')

% Other runs
power_fan = power_ac / 3;
fprintf('---Starting CVX with pF=133.33W pAC=400W pC=400W ELIM=500000---\n')
cvx_begin
    variables X_f(numRooms, numHours) X_a(numRooms, numHours)
    
    maximize(F'*sum((X_f.^0.5).*OccByHour, 2)+2*A'*sum((X_a.^0.8).*OccByHour, 2))
    subject to
    power_fan * F' * X_f * hOnesVec + ...
        power_ac * A' * X_a * hOnesVec + ...
        power_comp * hOnesVec' * U * uOnesVec <= ELIM
    X_f <= 1
    X_f >= 0
    X_a <= 1
    X_a >= 0
        
cvx_end


eF = power_fan * F' * X_f * hOnesVec
eA = power_ac * A' * X_a * hOnesVec
eC = power_comp * hOnesVec' * U * uOnesVec
EDIS = eF + eA + eC
X_f
csvwrite('xf1.csv', X_f);
X_a
csvwrite('xa1.csv', X_a);
fprintf('X_a < X_f\n')
X_a < X_f
numALessF = sum(sum(X_a < X_f))
fprintf('---End with pF=133.33W pAC=400W pC=400W ELIM=500000---\n\n')

power_fan = 100;
ELIM = 550000;
fprintf('---Starting CVX with pF=100W pAC=400W pC=400W ELIM=550000---\n')
cvx_begin
    variables X_f(numRooms, numHours) X_a(numRooms, numHours)
    
    maximize(F'*sum((X_f.^0.5).*OccByHour, 2)+2*A'*sum((X_a.^0.8).*OccByHour, 2))
    subject to
    power_fan * F' * X_f * hOnesVec + ...
        power_ac * A' * X_a * hOnesVec + ...
        power_comp * hOnesVec' * U * uOnesVec <= ELIM
    X_f <= 1
    X_f >= 0
    X_a <= 1
    X_a >= 0
        
cvx_end


eF = power_fan * F' * X_f * hOnesVec
eA = power_ac * A' * X_a * hOnesVec
eC = power_comp * hOnesVec' * U * uOnesVec
EDIS = eF + eA + eC
X_f
csvwrite('xf2.csv', X_f);
X_a
csvwrite('xa2.csv', X_a);
fprintf('X_a < X_f\n')
X_a < X_f
numALessF = sum(sum(X_a < X_f))
fprintf('---End with pF=100W pAC=400W pC=400W ELIM=550000---\n\n')

ELIM=500000;
power_fan = 1000;
fprintf('---Starting CVX with pF=1000W pAC=400W pC=400W ELIM=500000---\n')
cvx_begin
    variables X_f(numRooms, numHours) X_a(numRooms, numHours)
    
    maximize(F'*sum((X_f.^0.1).*OccByHour, 2)+2*A'*sum((X_a).*OccByHour, 2))
    subject to
    power_fan * F' * X_f * hOnesVec + ...
        power_ac * A' * X_a * hOnesVec + ...
        power_comp * hOnesVec' * U * uOnesVec <= ELIM
    X_f <= 1
    X_f >= 0
    X_a <= 1
    X_a >= 0
        
cvx_end


eF = power_fan * F' * X_f * hOnesVec
eA = power_ac * A' * X_a * hOnesVec
eC = power_comp * hOnesVec' * U * uOnesVec
EDIS = eF + eA + eC
X_f
csvwrite('xf2.csv', X_f);
X_a
csvwrite('xa2.csv', X_a);
fprintf('X_a < X_f\n')
X_a < X_f
numALessF = sum(sum(X_a < X_f))
fprintf('---End with pF=1000W pAC=400W pC=400W ELIM=500000---\n\n')



