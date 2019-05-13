function [Occupancies, UserHours, Fans, ACs, Computers] = expr_setup(numUsers, numRooms, numHours, numFans, numAC, numComputers)
%EXPR_SETUP Given the number of users, fans, hours/day, fans, A/C units,
%            and computers, output the appropriate Matrices/Vectors

% Setup Occupancies matrix

% Setup UserHours Matrix

% Setup Fans vectors
Fans = 3*ones(numRooms, 1);

% Setup AC vector
ACs = ones(numRooms, 1);

% Setup Computers vector
Computers = 10*ones(numRooms, 1);

end

