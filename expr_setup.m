function [Occupancies, UserHours, Fans, ACs, Computers] = expr_setup(numUsers, numRooms, numHours, numFans, numAC, numComputers)
%EXPR_SETUP Given the number of users, fans, hours/day, fans, A/C units,
%            and computers, output the appropriate Matrices/Vectors

% Setup Occupancies matrix
%  Each user only uses 1 room
Occupancies = zeros(numRooms, numUsers);
roomNums = randi([1 numRooms], numUsers, 1)
for j = 1:numUsers
   Occupancies(roomNums(j), j) = 1;
end

% Setup UserHours Matrix
%  Randomly choose hours in a day that each user is in their lab
UserHours = zeros(numHours, numUsers);
for j = 1:numUsers
    for i = 1:numHours
       if rand() >= 0.5
           UserHours(i,j) = 1;
       else
           UserHours(i,j) = 0;
       end
    end
end
% Setup Fans vectors
Fans = ones(numRooms, 1);

% Setup AC vector
ACs = ones(numRooms, 1);

% Setup Computers vector
Computers = 10*ones(numRooms, 1);

end

