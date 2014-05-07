% scatter all datasets (angle and distance)
clear;
clc;

int = aggregateAllDatasets('utm', 'int');
err = aggregateAllDatasets('utm', 'err_d');
dist = aggregateAllDatasets('utm', 'd');

% filters
step = 20;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);

scatter(int, err, 4, dist);

title('UTM indoor : color = distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);

ylim([-0.15, 0.2]);

%% Histogram

figure;
edges = [1 200 400 500 600 700 800 1000 1100 1150 1200 1600 1800 1900 2000 2100 2200 2250 2275 2300 2400 2500 2600 2650 2700 3000 4000 5000 7000 9000 12000 max(int)];

count = histc(int,edges);
bar(edges, count, 'histc')
set(gca, 'xlim', [edges(1) edges(end)])
set(gca, 'YTick', (0:7500:150000));
set(gca, 'XTick', (0:1000:max(int)));
%xticklabel_rotate(XTick,45,[],'Fontsize',15);
title('UTM indoor : distribution of intensity', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('frequency', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);

%% Median graph

figure;
x_hat = transpose(edges);
x_hat = [x_hat, x_hat, x_hat];
y_hat = zeros(length(x_hat), 3);
w = zeros(length(x_hat), 1);

for i = 1:length(x_hat)-1
    f = int > x_hat(i) & int < x_hat(i+1);
    w(i) = sum(f);
    y_hat(i, :) = quantile(err(f), [0.25, 0.5, 0.75]);
end

plot(x_hat(:,1), y_hat(:,2),'x-k')

title('UTM indoor : median', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);

