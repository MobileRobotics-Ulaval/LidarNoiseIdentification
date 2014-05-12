function [x_hat, y_hat, w] = ponderedStats(x, y, edgeVector)

x_hat = transpose(edgeVector);
x_hat = [x_hat, x_hat, x_hat];
y_hat = zeros(length(x_hat), 3);
w = zeros(length(x_hat), 1);

for i = 1:length(x_hat)-1
    f = x > x_hat(i) & x < x_hat(i+1);
    w(i) = sum(f);
    y_hat(i, :) = quantile(y(f), [0.25, 0.5, 0.75]);
end
