%% load data
clear;
clc;

load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/urg_corrDist.mat';


%% scatter distance (no angle data)

int = aggregateData_distance(data_distance,'urg', 'indoor', 'int');
err = aggregateData_distance(data_distance,'urg', 'indoor', 'err_d');
dist = aggregateData_distance(data_distance,'urg', 'indoor', 'd');
inc = aggregateData_distance(data_distance,'urg', 'indoor', 'inc');

% filters
step = 1;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);

figure;
scatter(int, err, 4, dist);
hold on;
[dx, dy, dw] = statsPerBin(int, err, 25);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('URG indoor : color = distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);

%ylim([-0.15, 0.2]);

%% Histogram


figure;
limitVector = [(0:1000:5000), 5500, 5800, 5950, 6000, 6100, 6200, (6350:150:6700), 6800, max(int)];

count = histc(int,limitVector);
bar(limitVector, count, 'histc')
set(gca, 'xlim', [limitVector(1) limitVector(end)])
%set(gca, 'YTick', (0:7500:150000));
set(gca, 'XTick', (0:500:max(int)));
%xticklabel_rotate(XTick,45,[],'Fontsize',15);
title('URG indoor : distribution of intensity', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('frequency', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);

%% Median graph

figure;

[x_hat, y_hat, w] = ponderedStats(int, err, limitVector);
medInt = x_hat(:,1);
medErr = y_hat(:,2);
plot(medInt, medErr,'x-k')

title('URG indoor : median', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);

%% Correction Err vs Int

int = aggregateData_distance(urg_corrDist,'urg', 'indoor', 'int');
err = aggregateData_distance(urg_corrDist,'urg', 'indoor', 'err_d');
dist = aggregateData_distance(urg_corrDist,'urg', 'indoor', 'd');
inc = aggregateData_distance(urg_corrDist,'urg', 'indoor', 'inc');

% filters
step = 1;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
inc = inc(int>0);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);
inc = inc(1:step:end);

figure;
scatter(int, err, 4, dist);
hold on;
[dx, dy, dw] = statsPerBin(int, err, 25);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('URG indoor, intensity corrected : color = distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);

%ylim([-0.15, 0.2]);


%% err vs inc (test)

varX = inc;
varY = err;

figure;
scatter(varX, varY, 4, dist);
hold on;
[dx, dy, dw] = statsPerBin(varX, varY, 25);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

%% err vs dist (test)

varX = dist;
varY = err;
color = inc;

figure;
scatter(varX, varY, 4, color);
hold on;
[dx, dy, dw] = statsPerBin(varX, varY, 25);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  
