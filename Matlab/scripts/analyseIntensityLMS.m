%% load data
clear;
clc;

load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';

%% scatter all datasets (angle and distance)

int = aggregateAllDatasets(data_distance, data_angle,'lms', 'outdoor', 'int');
err = aggregateAllDatasets(data_distance, data_angle,'lms', 'outdoor', 'err_d');
dist = aggregateAllDatasets(data_distance, data_angle,'lms', 'outdoor', 'd');
%inc = aggregateAllDatasets(data_distance, data_angle,'lms', 'outdoor', 'inc');

% filters
step = 20;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
%inc = inc(int>0);
int = int(int<2000);
err = err(int<2000);
dist = dist(int<2000);
%inc = inc(int<2000);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);
%inc = inc(1:step:end);

scatter(int, err, 4, dist);

title('LMS indoor/outdoor : color = distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
%set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);
%xlim([0, 10000]);
ylim([-0.4, 0.2]);


%% Histogram

int = aggregateAllDatasets(data_distance, data_angle,'lms', 'outdoor', 'int');
err = aggregateAllDatasets(data_distance, data_angle,'lms', 'outdoor', 'err_d');
dist = aggregateAllDatasets(data_distance, data_angle,'lms', 'outdoor', 'd');

% filters
step = 1;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
int = int(int<2000);
err = err(int<2000);
dist = dist(int<2000);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);

figure;
edgeVector = [(0:50:150), (200:25:325), (340:12:500), 515, 525, 550, 575, 600, 615, 625, 650, 700, 750, 800, 900, (1000:200:max(int))];

count = histc(int,edgeVector);
bar(edgeVector, count, 'histc')
set(gca, 'xlim', [edgeVector(1) edgeVector(end)])
set(gca, 'YTick', (0:50000:600000));
set(gca, 'XTick', (0:100:max(int)));
%xticklabel_rotate(XTick,45,[],'Fontsize',15);
title('LMS indoor/outdoor : distribution of intensity', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('frequency', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);


%% Median graph

figure;

[x_hat, y_hat, w] = ponderedStats(int, err, edgeVector);
medInt = x_hat(:,1);
medErr = y_hat(:,2);
plot(medInt, medErr,'x-k')

title('LMS indoor/outdoor : median', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);

%% Regression Err vs Int
% ***** A REFAIRE ******
% -0.002286*exp(-((x-360)./74).^2)+0.0067*exp(-((x-525)./500).^2)+1.785e-5*x+0.008

cftool('/home/cantor/Desktop/Robotique/matlab_scripts/regression/LMS_allDatasets_errVSint.sfit');