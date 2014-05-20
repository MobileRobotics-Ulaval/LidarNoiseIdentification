%% load data
clear;
clc;

load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';

%% scatter distance (no angle data)

int = aggregateData_distance(data_distance,'urg', 'indoor', 'int');
err = aggregateData_distance(data_distance,'urg', 'indoor', 'err_d');
dist = aggregateData_distance(data_distance,'urg', 'indoor', 'd');

% filters
step = 20;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);

scatter(int, err, 4, dist);

title('URG indoor : color = distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);

%ylim([-0.15, 0.2]);

%% Histogram

int = aggregateData_distance('urg', 'indoor', 'int');
err = aggregateData_distance('urg', 'indoor', 'err_d');
dist = aggregateData_distance('urg', 'indoor', 'd');

% filters
step = 20;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);


figure;
edgeVector = [(0:1000:5000), 5500, (5800:150:6700), max(int)];

count = histc(int,edgeVector);
bar(edgeVector, count, 'histc')
set(gca, 'xlim', [edgeVector(1) edgeVector(end)])
%set(gca, 'YTick', (0:7500:150000));
set(gca, 'XTick', (0:500:max(int)));
%xticklabel_rotate(XTick,45,[],'Fontsize',15);
title('URG indoor : distribution of intensity', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('frequency', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);

%% Median graph

figure;

[x_hat, y_hat, w] = ponderedStats(int, err, edgeVector);
medInt = x_hat(:,1);
medErr = y_hat(:,2);
plot(medInt, medErr,'x-k')

title('URG indoor : median', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);

%% Regression Err vs Int

% 0.07418*exp(-((x-5000)./2000).^2)+0.0403*exp(-((x-5800)./430).^2)+-3e-6*x+-0.013

cftool('/home/cantor/Desktop/Robotique/matlab_scripts/regression/URG_allDatasets_errVSint.sfit');