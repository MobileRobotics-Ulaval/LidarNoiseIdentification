function [ correctionVector ] = correctionFunction(x_hat, y_hat, rawVector)

% correction function -> error vs intensity.
% Based on a linear regretion between each bin of x_hat vector

%   Output : distance correction vector
% ** x_hat and y_hat must be the same size **

correctionVector = zeros(length(rawVector), 1);

for i = 1:length(rawVector)
    for j = 1:length(x_hat)

        if rawVector(i) <= x_hat(j)

             if rawVector(i) <= x_hat(1) % valeur plus basse que la plus petite valeur
                deltaDist = y_hat(1);
             else
                m = (y_hat(j) - y_hat(j-1)) / (x_hat(j) - x_hat(j-1));
                b = y_hat(j) - m*x_hat(j);
                deltaDist = m*rawVector(i) + b;
             end

             correctionVector(i,1) = deltaDist;
             break
        end                
    end
end


end

