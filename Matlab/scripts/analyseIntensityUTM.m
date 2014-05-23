%% load data
clear;
clc;

load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/utm_corrDist.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/utm_corrAngle.mat';

%% scatter all datasets (angle and distance)

figure;
int = aggregateAllDatasets(data_distance, data_angle, 'utm', 'indoor', 'int');
err = aggregateAllDatasets(data_distance, data_angle,'utm', 'indoor', 'err_d');
dist = aggregateAllDatasets(data_distance, data_angle,'utm', 'indoor', 'd');

% filters
step = 10;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);

scatter(int, err, 4, dist);
hold on;
[dx, dy, dw] = statsPerBin(int, err, 100);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('UTM indoor : color = distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);

ylim([-0.15, 0.2]);

%% Histogram

int = aggregateAllDatasets(data_distance, data_angle,'utm', 'indoor', 'int');
err = aggregateAllDatasets(data_distance, data_angle,'utm', 'indoor', 'err_d');

% filters
step = 1;
int = int(int>0);
err = err(int>0);
int = int(1:step:end);
err = err(1:step:end);

figure;
limitVector = [1 200 400 500 600 700 800 1000 1100 1150 1200 1600 1800 1900 2000 2100 2200 2250 2275 2300 2400 2500 2600 2650 2700 3000 4000 5000 7000 9000 12000 max(int)];

count = histc(int,limitVector);
bar(limitVector, count, 'histc')
set(gca, 'xlim', [limitVector(1) limitVector(end)])
%set(gca, 'YTick', (0:7500:150000));
set(gca, 'XTick', (0:1000:max(int)));
%xticklabel_rotate(XTick,45,[],'Fontsize',15);
title('UTM indoor : distribution of intensity', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('frequency', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);

%% Median graph

figure;

[x_hat, y_hat, w] = ponderedStats(int, err, limitVector);
medInt = x_hat(:,1);
medErr = y_hat(:,2);
plot(medInt, medErr,'x-k')

title('UTM indoor : median', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
xlim([0,max(int)]);
set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);

%% Correction Err vs Int

figure;

int = aggregateAllDatasets(utm_corrDist, utm_corrAngle, 'utm', 'indoor', 'int');
err = aggregateAllDatasets(utm_corrDist, utm_corrAngle,'utm', 'indoor', 'err_d');
%dist = aggregateAllDatasets(utm_corrDist, utm_corrAngle,'utm', 'indoor', 'd');
inc = aggregateAllDatasets(utm_corrDist, utm_corrAngle,'utm', 'indoor', 'inc');

% filters
step = 10;
int = int(int>0);
err = err(int>0);
inc = inc(int>0);
%dist = dist(int>0);

int = int(1:step:end);
err = err(1:step:end);
%dist = dist(1:step:end);
inc = inc(1:step:end);

%scatter(int, err, 4, dist);
scatter(int, err, 4, inc);
hold on;
[dx, dy, dw] = statsPerBin(int, err, 100);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('UTM indoor : color = incidence', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);

ylim([-0.15, 0.2]);

%% test analyse incidence

figure;

int = aggregateAllDatasets(utm_corrDist, utm_corrAngle, 'utm', 'indoor', 'int');
err = aggregateAllDatasets(utm_corrDist, utm_corrAngle,'utm', 'indoor', 'err_d');
dist = aggregateAllDatasets(utm_corrDist, utm_corrAngle,'utm', 'indoor', 'd');
inc = aggregateAllDatasets(utm_corrDist, utm_corrAngle,'utm', 'indoor', 'inc');

% filters
step = 10;
int = int(int>0);
err = err(int>0);
inc = inc(int>0);
dist = dist(int>0);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);
inc = inc(1:step:end);

scatter3(inc, err, 4, int);
hold on;
[dx, dy, dw] = statsPerBin(inc, err, 100);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

medInc = dx(:,1);
medInt = dy(:,2);

title('UTM (int corrected) indoor : color = error depth', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('incidence','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
%set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);

%ylim([-0.1, 0.1]);



%% test 2 analyse incidence

figure;

int = aggregateAllDatasets(utm_corrDist, utm_corrAngle, 'utm', 'indoor', 'int');
err = aggregateAllDatasets(utm_corrDist, utm_corrAngle,'utm', 'indoor', 'err_d');
dist = aggregateAllDatasets(utm_corrDist, utm_corrAngle,'utm', 'indoor', 'd');
inc = aggregateAllDatasets(utm_corrDist, utm_corrAngle,'utm', 'indoor', 'inc');

% filters
step = 10;
int = int(int>0);
err = err(int>0);
inc = inc(int>0);
dist = dist(int>0);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);
inc = inc(1:step:end);

scatter(int, inc, 4, err);
hold on;
[dx, dy, dw] = statsPerBin(inc, err, 100);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

medInc = dx(:,1);
medInt = dy(:,2);

title('UTM (int corrected) indoor : color = error depth', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
%set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);

%ylim([-0.1, 0.1]);



