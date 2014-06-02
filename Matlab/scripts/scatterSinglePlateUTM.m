%% load data
clear;
clc;
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/utm_corrAngle.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/utm_corrDist.mat';

%% board Distance
figure;
dataset = utm_corrDist;
%dataset = data_distance;

dInt = aggregateSinglePlate_distance(dataset,'utm', 'board', 'indoor', 'int');
dErr = aggregateSinglePlate_distance(dataset,'utm', 'board', 'indoor', 'err_d');
dDist = aggregateSinglePlate_distance(dataset,'utm', 'board', 'indoor', 'd');
dInc = aggregateSinglePlate_distance(dataset,'utm', 'board', 'indoor', 'inc');
dArea = aggregateSinglePlate_distance(dataset, 'utm', 'board', 'indoor', 'beamArea');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);
dInc = dInc(dInt>0);
dArea = dArea(dInt>0);
step = 1;

hold on;
scatter(dArea(1:step:end), dErr(1:step:end), 4, dDist(1:step:end));
[dx, dy, dw] = statsPerBin(dArea(1:step:end), dErr(1:step:end), 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('board : Color = distance')
xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);


%% alu Distance
figure;

%dataset = utm_corrDist;
dataset = data_distance;

dInt = aggregateSinglePlate_distance(dataset,'utm', 'alu', 'indoor', 'int');
dErr = aggregateSinglePlate_distance(dataset,'utm', 'alu', 'indoor', 'err_d');
dDist = aggregateSinglePlate_distance(dataset,'utm', 'alu', 'indoor', 'd');
%dInc = aggregateSinglePlate_distance(dataset,'utm', 'alu', 'indoor', 'inc');
dArea = aggregateSinglePlate_distance(dataset, 'utm', 'alu', 'indoor', 'beamArea');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);
%dInc = dInc(dInt>0);
dArea = dArea(dInt>0);

step = 1;

hold on;
scatter(dArea(1:step:end), dErr(1:step:end), 4, dDist(1:step:end));
[dx, dy, dw] = statsPerBin(dArea(1:step:end), dErr(1:step:end), 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('alu : Color = distance')
xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);

%% iron Distance
figure;
dataset = utm_corrDist;
%dataset = data_distance;

dInt = aggregateSinglePlate_distance(dataset,'utm', 'iron', 'indoor', 'int');
dErr = aggregateSinglePlate_distance(dataset,'utm', 'iron', 'indoor', 'err_d');
dDist = aggregateSinglePlate_distance(dataset,'utm', 'iron', 'indoor', 'd');
%dInc = aggregateSinglePlate_distance(dataset,'utm', 'iron', 'indoor', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);
%dInc = dInc(dInt>0);

step = 1;

hold on;
scatter(dInt(1:step:end), dErr(1:step:end), 4, dDist(1:step:end));
[dx, dy, dw] = statsPerBin(dInt(1:step:end), dErr(1:step:end), 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('iron : Color = distance')
xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);


%% steel Distance
figure;
dataset = utm_corrDist;
%dataset = data_distance;

dInt = aggregateSinglePlate_distance(dataset,'utm', 'steel', 'indoor', 'int');
dErr = aggregateSinglePlate_distance(dataset,'utm', 'steel', 'indoor', 'err_d');
dDist = aggregateSinglePlate_distance(dataset,'utm', 'steel', 'indoor', 'd');
%dInc = aggregateSinglePlate_distance(dataset,'utm', 'steel', 'indoor', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);
%dInc = dInc(dInt>0);

step = 1;

hold on;
scatter(dInt(1:step:end), dErr(1:step:end), 4, dDist(1:step:end));
[dx, dy, dw] = statsPerBin(dInt(1:step:end), dErr(1:step:end), 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('steel : Color = distance')
xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);

%% Board angle
figure;

dInt = aggregateSinglePlate_angle(data_angle,'utm', 'board', 'int');
dErr = aggregateSinglePlate_angle(data_angle,'utm', 'board', 'err_d');
dInc = aggregateSinglePlate_angle(data_angle,'utm', 'board', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dInc = dInc(dInt>0);

step = 1;

hold on;
scatter(dInc(1:step:end), dErr(1:step:end), 4, dInt(1:step:end));
[dx, dy, dw] = statsPerBin(dInc(1:step:end), dErr(1:step:end), 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('board : color = intensity')
xlabel('incidence');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);


%% Alu angle
figure;

dInt = aggregateSinglePlate_angle(data_angle,'utm', 'alu', 'int');
dErr = aggregateSinglePlate_angle(data_angle,'utm', 'alu', 'err_d');
dInc = aggregateSinglePlate_angle(data_angle,'utm', 'alu', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dInc = dInc(dInt>0);

step = 1;

hold on;
scatter(dInc(1:step:end), dErr(1:step:end), 4, dInt(1:step:end));
[dx, dy, dw] = statsPerBin(dInc(1:step:end), dErr(1:step:end), 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('alu : color = intensity')
xlabel('incidence');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);


%% Iron angle
figure;

dInt = aggregateSinglePlate_angle(data_angle,'utm', 'iron', 'int');
dErr = aggregateSinglePlate_angle(data_angle,'utm', 'iron', 'err_d');
dInc = aggregateSinglePlate_angle(data_angle,'utm', 'iron', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dInc = dInc(dInt>0);

step = 1;

hold on;
scatter(dInc(1:step:end), dErr(1:step:end), 4, dInt(1:step:end));
[dx, dy, dw] = statsPerBin(dInc(1:step:end), dErr(1:step:end), 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('iron : color = intensity')
xlabel('incidence');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);



%% Steel angle
figure;

dInt = aggregateSinglePlate_angle(data_angle,'utm', 'steel', 'int');
dErr = aggregateSinglePlate_angle(data_angle,'utm', 'steel', 'err_d');
dInc = aggregateSinglePlate_angle(data_angle,'utm', 'steel', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dInc = dInc(dInt>0);

step = 1;

hold on;
scatter(dInc(1:step:end), dErr(1:step:end), 4, dInt(1:step:end));
[dx, dy, dw] = statsPerBin(dInc(1:step:end), dErr(1:step:end), 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('steel : color = intensity')
xlabel('incidence');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);
