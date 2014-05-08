%% scatter all datasets (angle and distance)
clear;
clc;

int = aggregateAllDatasets('lms', 'outdoor', 'int');
err = aggregateAllDatasets('lms', 'outdoor', 'err_d');
dist = aggregateAllDatasets('lms', 'outdoor', 'd');

% filters
step = 20;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
int = int(int<2000);
err = err(int<2000);
dist = dist(int<2000);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);

scatter(int, err, 4, dist);

title('LMS indoor/outdoor : color = distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
%set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);
%xlim([0, 10000]);
ylim([-0.4, 0.2]);


%% Histogram

int = aggregateAllDatasets('lms', 'outdoor', 'int');
err = aggregateAllDatasets('lms', 'outdoor', 'err_d');
dist = aggregateAllDatasets('lms', 'outdoor', 'd');

% filters
step = 1;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);


figure;
edges = [(1:100:max(int))];

count = histc(int,edges);
bar(edges, count, 'histc')
set(gca, 'xlim', [edges(1) edges(end)])
set(gca, 'YTick', (0:50000:600000));
set(gca, 'XTick', (0:1000:max(int)));
%xticklabel_rotate(XTick,45,[],'Fontsize',15);
title('UTM indoor : distribution of intensity', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('frequency', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);
