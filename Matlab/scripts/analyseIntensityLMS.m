%% load data
clear;
clc;

load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/lms_corrDist.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/lms_corrAngle.mat';


%% scatter all datasets (angle and distance)

datasetD = data_distance;
datasetA = data_angle;

int = aggregateAllDatasets(datasetD, datasetA, 'lms', 'outdoor', 'int');
err = aggregateAllDatasets(datasetD, datasetA, 'lms', 'outdoor', 'err_d');
dist = aggregateAllDatasets(datasetD, datasetA, 'lms', 'outdoor', 'd');
inc = aggregateAllDatasets(datasetD, datasetA, 'lms', 'outdoor', 'inc');

% filters
step = 1;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
inc = inc(int>0);
int = int(int<2000); % because 1 point at 4000
err = err(int<2000);
dist = dist(int<2000);
inc = inc(int<2000);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);
inc = inc(1:step:end);

figure;
scatter(int, err, 4, inc);
hold on;
[dx, dy, dw] = statsPerBin(int, err, 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('LMS indoor/outdoor : color = incidence', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
%set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);
%xlim([0, 10000]);
% ylim([-0.4, 0.2]);


%% Histogram

int = aggregateAllDatasets(data_distance, data_angle,'lms', 'outdoor', 'int');
err = aggregateAllDatasets(data_distance, data_angle,'lms', 'outdoor', 'err_d');
dist = aggregateAllDatasets(data_distance, data_angle,'lms', 'outdoor', 'd');
inc = aggregateAllDatasets(data_distance, data_angle,'lms', 'outdoor', 'inc');
area = aggregateAllDatasets(lms_corrDist, lms_corrAngle, 'lms', 'outdoor', 'beamArea');

% filters
step = 1;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
int = int(int<2000); % single point at 4000 int
err = err(int<2000);
dist = dist(int<2000);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);

% remove random sample from 20 cm data
shortDist = dist(dist<1);
longDist = dist(dist>=1);
randIndex = randsample((1:1:732461), 350000)';
shortDistRand = shortDist(randIndex);
randDist = [shortDistRand ; longDist];

% sampled variables 
randShortInt = int(randIndex);
randLongInt = int(dist>=1);
randInt = [randShortInt ; randLongInt];

randShortErr = err(randIndex);
randLongErr = err(dist>=1);
randErr = [randShortErr ; randLongErr];

randShortInc = inc(randIndex);
randLongInc = inc(dist>=1);
randInc = [randShortInc ; randLongInc];

limitVector = [(0:50:150), (200:25:325), (340:12:500), 515, 525, 550, 575, 600, 615, 625, 650, 700, 750, 800, 900, (1000:200:max(int))];

% raw histogram
figure;
count = histc(int,limitVector);
bar(limitVector, count, 'histc')
set(gca, 'xlim', [limitVector(1) limitVector(end)])
set(gca, 'YTick', (0:50000:600000));
set(gca, 'XTick', (0:100:max(int)));
%xticklabel_rotate(XTick,45,[],'Fontsize',15);
title('LMS indoor/outdoor : distribution of intensity', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('frequency', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);

% histogram with pondered distance vector
figure;
count = histc(randInt,limitVector);
bar(limitVector, count, 'histc')
set(gca, 'xlim', [limitVector(1) limitVector(end)])
set(gca, 'YTick', (0:50000:600000));
set(gca, 'XTick', (0:100:max(randInt)));
%xticklabel_rotate(XTick,45,[],'Fontsize',15);
title('LMS indoor/outdoor : distribution of intensity (pondered)', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('frequency', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);

figure;
hist(dist)
% set(gca, 'YTick', (0:50000:600000));
% set(gca, 'XTick', (0:100:max(int)));
%xticklabel_rotate(XTick,45,[],'Fontsize',15);
title('LMS indoor/outdoor : distribution of distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('distance','Fontsize',15, 'Fontweight', 'demi');
ylabel('frequency', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);

figure;
hist(randDist)
% set(gca, 'YTick', (0:50000:600000));
% set(gca, 'XTick', (0:100:max(int)));
%xticklabel_rotate(XTick,45,[],'Fontsize',15);
title('LMS indoor/outdoor : distribution of distance (pondered)', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('distance','Fontsize',15, 'Fontweight', 'demi');
ylabel('frequency', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);

%% Scatter all datasets (pondered distance)

figure;
scatter(randInt, randErr, 4, randInc);
hold on;
[dx, dy, dw] = statsPerBin(randInt, randErr, 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('LMS indoor/outdoor : color = incidence', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
%set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);
%xlim([0, 10000]);
% ylim([-0.4, 0.2]);


%% Median graph *** note : la mediane est influencee par le grand nombre de donnees a 20 cm

% raw median
figure;
[x_hat, y_hat, w] = ponderedStats(int, err, limitVector);
medInt = x_hat(:,1);
medErr = y_hat(:,2);
plot(medInt, medErr,'x-k')
title('LMS indoor/outdoor : median', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'XTick', (0:250:max(int)));
set(gca, 'Fontsize', 15);

% median with pondered distance vector
figure;
[pndX_hat, pndY_hat, pndW] = ponderedStats(randInt, randErr, limitVector);
pndMedInt = pndX_hat(:,1);
pndMedErr = pndY_hat(:,2);
plot(pndMedInt, pndMedErr,'x-k')
title('LMS indoor/outdoor : median (pondered)', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'XTick', (0:250:max(randInt)));
set(gca, 'Fontsize', 15);


%% Corrected Err vs Int (color incidence)

int = aggregateAllDatasets(lms_corrDist, lms_corrAngle, 'lms', 'outdoor', 'int');
err = aggregateAllDatasets(lms_corrDist, lms_corrAngle, 'lms', 'outdoor', 'err_d');
dist = aggregateAllDatasets(lms_corrDist, lms_corrAngle, 'lms', 'outdoor', 'd');
inc = aggregateAllDatasets(lms_corrDist, lms_corrAngle, 'lms', 'outdoor', 'inc');
area = aggregateAllDatasets(lms_corrDist, lms_corrAngle, 'lms', 'outdoor', 'beamArea');

% filters
step = 1;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
inc = inc(int>0);
area = area(int>0);
int = int(int<2000); % because of 1 point at 4000
err = err(int<2000);
dist = dist(int<2000);
inc = inc(int<2000);
area = area(int<2000);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);
inc = inc(1:step:end);
area = area(1:step:end);

% remove random sample from 20 cm data
shortDist = dist(dist<1);
longDist = dist(dist>=1);
randIndex = randsample((1:1:713655), 350000)';
shortDistRand = shortDist(randIndex);
randDist = [shortDistRand ; longDist];

% sampled variables 
randShortInt = int(randIndex);
randLongInt = int(dist>=1);
randInt = [randShortInt ; randLongInt];

randShortErr = err(randIndex);
randLongErr = err(dist>=1);
randErr = [randShortErr ; randLongErr];

randShortInc = inc(randIndex);
randLongInc = inc(dist>=1);
randInc = [randShortInc ; randLongInc];

randShortArea = area(randIndex);
randLongArea = area(dist>=1);
randArea = [randShortArea ; randLongInc];


figure;
scatter(randInt, randErr, 4, randInc);
hold on;
[dx, dy, dw] = statsPerBin(randInt, randErr, 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('LMS indoor/outdoor (intensity corrected) : color = incidence', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
%set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);
%xlim([0, 10000]);
% ylim([-0.4, 0.2]);


%% Corrected Err vs Int (color beam area)

figure;
scatter(randInt, randErr, 4, randArea);
hold on;
[dx, dy, dw] = statsPerBin(randInt, randErr, 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('LMS indoor/outdoor (intensity corrected) : color = beam area', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
%set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);
%xlim([0, 10000]);
% ylim([-0.4, 0.2]);
