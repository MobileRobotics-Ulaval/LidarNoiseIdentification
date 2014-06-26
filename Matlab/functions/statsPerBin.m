function [x_hat, y_hat, w] = statsPerBin(x, y, nbBin)
% in : x, y, nombre de sous-ensembles
% ex : distance, erreur_distance, 50
% out : x_hat = 3 colonnes identiques de l'intervale de x
%       y_hat : y(:,1) bas quartile, y(:,2) mediane, y(:,3) haut quartile

x_hat = linspace(min(x), max(x), nbBin)';
x_hat = [x_hat, x_hat, x_hat];
y_hat = zeros(length(x_hat), 3);
w =  zeros(length(x_hat), 1);

for i = 1:length(x_hat)-1
    f = x > x_hat(i) & x < x_hat(i+1);
    w(i) = sum(f);
    y_hat(i, :) = quantile(y(f), [0.25, 0.5, 0.75]);
end