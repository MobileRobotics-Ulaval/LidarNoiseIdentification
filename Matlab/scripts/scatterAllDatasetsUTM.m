% scatter all datasets (angle and distance)

dInt = aggregateData_distance('utm','indoor','int');
dErr = aggregateData_distance('utm','indoor','err_d');
dDist = aggregateData_distance('utm','indoor','d');
aInt = aggregateData_angles('utm','int');
aErr = aggregateData_angles('utm','err_d');
aDist = aggregateData_angles('utm','d');

% aggregation
int = [dInt ; aInt];
err = [dErr ; aErr];
dist = [dDist ; aDist];

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
dInt2 = aggregateData_distance('utm','indoor','int');
aInt2 = aggregateData_angles('utm','int');

% aggregation
int2 = [dInt2 ; aInt2];

% filters
step = 1;
int2 = int2(int2>0);
int2 = int2(1:step:end);

edges = [1 400 800 1200 1600 1800 1900 2000 2100 2200 2300 2400 2500 2600 2700 3000 5000 9000 max(int2)];
count = histc(int2,edges);
bar(edges, count, 'histc')
set(gca, 'xlim', [edges(1) edges(end)])
set(gca, 'YTick', (0:7500:150000));
set(gca, 'XTick', (0:1000:max(int3)));
%xticklabel_rotate(XTick,45,[],'Fontsize',15);
title('UTM indoor : distribution of intensity', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('frequency', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);

%% Median graph

% possibilité : faire un statsPerBin avec bcp de bin et
%               pour chaque tranche de l'histo, faire le plot
%               (1:x:end) pour pondérer le nb de bin

figure;
hold on;
dInt3 = aggregateData_distance('utm','indoor','int');
aInt3 = aggregateData_angles('utm','int');
dErr3 = aggregateData_distance('utm','indoor','err_d');
aErr3 = aggregateData_angles('utm','err_d');

% aggregation
int3 = [dInt3 ; aInt3];
err3 = [dErr3 ; aErr3];

% filters
step = 1;
int3 = int3(int3>0);
int3 = int3(1:step:end);
err3 = err3(int3>0);
err3 = err3(1:step:end);

edges = transpose([1 400 800 1200 1600 1800 1900 2000 2100 2200 2300 2400 2500 2600 2700 3000 5000 9000 max(int2)]);
x_hat = edges;
x_hat = [x_hat, x_hat, x_hat];
y_hat = zeros(length(x_hat), 3);
w = zeros(length(x_hat), 1);

for i = 1:length(x_hat)-1
    f = int3 > x_hat(i) & int3 < x_hat(i+1);
    w(i) = sum(f);
    y_hat(i, :) = quantile(err3(f), [0.25, 0.5, 0.75]);
end

plot(x_hat(:,1), y_hat(:,2),'.k')

title('UTM indoor : median', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'XTick', (0:1000:max(int)));
ylim([-0.15, 0.2]);
set(gca, 'Fontsize', 15);

