%% load data
clear;
clc;

load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';

%% scatter all datasets (angle and distance)

int = aggregateAllDatasets(data_distance, data_angle, 'utm', 'indoor', 'int');
err = aggregateAllDatasets(data_distance, data_angle,'utm', 'indoor', 'err_d');
dist = aggregateAllDatasets(data_distance, data_angle,'utm', 'indoor', 'd');

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

int = aggregateAllDatasets(data_distance, data_angle,'utm', 'indoor', 'int');
err = aggregateAllDatasets(data_distance, data_angle,'utm', 'indoor', 'err_d');
dist = aggregateAllDatasets(data_distance, data_angle,'utm', 'indoor', 'd');

% filters
step = 1;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);


figure;
edgeVector = [1 200 400 500 600 700 800 1000 1100 1150 1200 1600 1800 1900 2000 2100 2200 2250 2275 2300 2400 2500 2600 2650 2700 3000 4000 5000 7000 9000 12000 max(int)];

count = histc(int,edgeVector);
bar(edgeVector, count, 'histc')
set(gca, 'xlim', [edgeVector(1) edgeVector(end)])
%set(gca, 'YTick', (0:7500:150000));
set(gca, 'XTick', (0:1000:max(int)));
%xticklabel_rotate(XTick,45,[],'Fontsize',15);
title('UTM indoor : distribution of intensity', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('frequency', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);

%% Median graph

figure;

[x_hat, y_hat, w] = ponderedStats(int, err, edgeVector);
medInt = x_hat(:,1);
medErr = y_hat(:,2);
plot(medInt, medErr,'x-k')

title('UTM indoor : median', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);

%% Regression Err vs Int

% -0.021*exp(-((x-616.7)./409).^2)+0.02*exp(-((x-2400)./800).^2)+4.892e-7*x+0.0086

cftool('/home/cantor/Desktop/Robotique/matlab_scripts/regression/UTM_allDatasets_errVSint.sfit');


%% test (with corrected data)

load '/home/cantor/Desktop/correctedDist.mat'

int = aggregateData_distance(correctedData_dist,'utm', 'indoor', 'int');
err = aggregateData_distance(correctedData_dist,'utm', 'indoor', 'err_d');
dist = aggregateData_distance(correctedData_dist,'utm', 'indoor', 'd');
inc = aggregateData_distance(correctedData_dist,'utm', 'indoor', 'inc');


% filters
step = 20;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
inc = inc(int>0);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);
inc = inc(1:step:end);

scatter(int, err, 4, inc);
hold on;
[dx, dy, dw] = statsPerBin(int, err, 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.-r')
plot(dx(:,1),dy(:,3),'--k')  

title('UTM indoor : color = distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);

