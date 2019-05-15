function [XF] = fanSat(X_f)
% When fans go above 50%, satisfaction begins to saturate
xsize = size(X_f);
XF = zeros(xsize);
shift = (0.7^0.5 + 0.7^1.5);
for i = 1:xsize(1)
    for j = 1:xsize(2)
        if (X_f(i,j) < 0.7)
           XF(i,j) = X_f(i,j)^0.5;
        else
            % Added term to make sure fanSat is continuous
            XF(i,j) = -X_f(i,j)^1.5 + shift;
        end
    end
end

end