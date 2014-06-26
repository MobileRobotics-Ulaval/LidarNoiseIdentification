function [x_hat, y_hat, w] = ponderedStats(x, y, limitVector)

% limitVector needs to be sorted

x_hat = zeros(length(limitVector)-1, 3);
y_hat = zeros(length(limitVector)-1, 3);
w = zeros(length(x_hat), 1);

for i = 1:length(limitVector)-1
    f = (x > limitVector(i) & x < limitVector(i+1));
    w(i) = sum(f);
    mid = limitVector(i) + (limitVector(i+1) - limitVector(i))/2;
    x_hat(i,:) = [mid, mid, mid];
    y_hat(i, :) = quantile(y(f), [0.25, 0.5, 0.75]);
end
