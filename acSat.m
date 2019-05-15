function [XA] = acSat(X_a)
% When fans go above 50%, satisfaction begins to saturate
xsize = size(X_a);
XA = zeros(xsize);
midShift = (0.3^0.5 - 0.3^0.3);
highSlope = -(0.8^0.3+midShift)/0.2;
highShift = (0.8^0.3+midShift)-highSlope*0.8;

for i = 1:xsize(1)
    for j = 1:xsize(2)
        if (X_a(i,j) <= 0.3)
           XA(i,j) = X_a(i,j)^0.5;
        elseif (X_a(i,j) <= 0.8)
            % Added term to make sure fanSat is continuous
            XA(i,j) = X_a(i,j)^0.3 + midShift;
        else
            XA(i,j) = highSlope*X_a(i,j) + highShift;
        end
    end
end

end