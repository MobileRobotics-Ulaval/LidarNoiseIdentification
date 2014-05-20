%% load data

clear;
clc;

load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';

%% board Distance

dInt = aggregateSinglePlate_distance(data_distance,'lms', 'board', 'outdoor', 'int');
dErr = aggregateSinglePlate_distance(data_distance,'lms', 'board', 'outdoor', 'err_d');
dDist = aggregateSinglePlate_distance(data_distance,'lms', 'board', 'outdoor', 'd');
%dInc = aggregateSinglePlate_distance(data_distance,'lms', 'board', 'outdoor', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);
%dInc = dInc(dInt>0);

step = 18;

hold on;
scatter(dInt(1:step:end), dErr(1:step:end), 4, dDist(1:step:end));
% [dx, dy, dw] = statsPerBin(dInt(1:step:end), dErr(1:step:end), 50);
% plot(dx(:,1),dy(:,1),'--k')
% plot(dx(:,1),dy(:,2),'.k')
% plot(dx(:,1),dy(:,3),'--k')  

title('board : color = distance')
xlabel('intensity');
ylabel('error (m)');
ylim([-0.1, 0.1]); % outliers
%xlim([0, 14000]);


%% alu Distance
figure;
dInt = aggregateSinglePlate_distance(data_distance,'lms', 'alu', 'outdoor', 'int');
dErr = aggregateSinglePlate_distance(data_distance,'lms', 'alu', 'outdoor', 'err_d');
dDist = aggregateSinglePlate_distance(data_distance,'lms', 'alu', 'outdoor', 'd');
%dInc = aggregateSinglePlate_distance(data_distance,'lms', 'alu', 'outdoor', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);
%dInc = dInc(dInt>0);

step = 18;

hold on;
scatter(dInt(1:step:end), dErr(1:step:end), 4, dDist(1:step:end));
% [dx, dy, dw] = statsPerBin(dInt(1:step:end), dErr(1:step:end), 50);
% plot(dx(:,1),dy(:,1),'--k')
% plot(dx(:,1),dy(:,2),'.k')
% plot(dx(:,1),dy(:,3),'--k')  

title('alu : color = distance')
xlabel('intensity');
ylabel('error (m)');
ylim([-0.15, 0.1]);
%xlim([0, 14000]);

%% iron Distance
figure;

dInt = aggregateSinglePlate_distance(data_distance,'lms', 'iron', 'outdoor', 'int');
dErr = aggregateSinglePlate_distance(data_distance,'lms', 'iron', 'outdoor', 'err_d');
dDist = aggregateSinglePlate_distance(data_distance,'lms', 'iron', 'outdoor', 'd');
%dInc = aggregateSinglePlate_distance(data_distance,'lms', 'iron', 'outdoor', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);
%dInc = dInc(dInt>0);

step = 18;

hold on;
scatter(dInt(1:step:end), dErr(1:step:end), 4, dDist(1:step:end));
% [dx, dy, dw] = statsPerBin(dInt(1:step:end), dErr(1:step:end), 50);
% plot(dx(:,1),dy(:,1),'--k')
% plot(dx(:,1),dy(:,2),'.k')
% plot(dx(:,1),dy(:,3),'--k')  

title('iron : color = distance')
xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);


%% steel Distance
figure;

dInt = aggregateSinglePlate_distance(data_distance,'lms', 'steel', 'outdoor', 'int');
dErr = aggregateSinglePlate_distance(data_distance,'lms', 'steel', 'outdoor', 'err_d');
dDist = aggregateSinglePlate_distance(data_distance,'lms', 'steel', 'outdoor', 'd');
%dInc = aggregateSinglePlate_distance(data_distance,'lms', 'steel', 'outdoor', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);
%dInc = dInc(dInt>0);

step = 18;

hold on;
scatter(dInt(1:step:end), dErr(1:step:end), 4, dDist(1:step:end));
% [dx, dy, dw] = statsPerBin(dInt(1:step:end), dErr(1:step:end), 50);
% plot(dx(:,1),dy(:,1),'--k')
% plot(dx(:,1),dy(:,2),'.k')
% plot(dx(:,1),dy(:,3),'--k')  

title('steel : color = distance')
xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);

%% Board angle

figure;
dInt = aggregateSinglePlate_angle(data_angle,'lms', 'board', 'int');
dErr = aggregateSinglePlate_angle(data_angle,'lms', 'board', 'err_d');
dInc = aggregateSinglePlate_angle(data_angle,'lms', 'board', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dInc = dInc(dInt>0);

step = 10;

hold on;
scatter(dInt(1:step:end), dErr(1:step:end), 4, dInc(1:step:end));
% [dx, dy, dw] = statsPerBin(dInt(1:step:end), dErr(1:step:end), 50);
% plot(dx(:,1),dy(:,1),'--k')
% plot(dx(:,1),dy(:,2),'.k')
% plot(dx(:,1),dy(:,3),'--k')  

title('board : color = incidence')
xlabel('intensity');
ylabel('error (m)');
ylim([-0.02, 0.06]);
%xlim([0, 14000]);


%% Alu angle

figure;
dInt = aggregateSinglePlate_angle(data_angle,'lms', 'alu', 'int');
dErr = aggregateSinglePlate_angle(data_angle,'lms', 'alu', 'err_d');
dInc = aggregateSinglePlate_angle(data_angle,'lms', 'alu', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dInc = dInc(dInt>0);

step = 10;

hold on;
scatter(dInt(1:step:end), dErr(1:step:end), 4, dInc(1:step:end));
% [dx, dy, dw] = statsPerBin(dInt(1:step:end), dErr(1:step:end), 50);
% plot(dx(:,1),dy(:,1),'--k')
% plot(dx(:,1),dy(:,2),'.k')
% plot(dx(:,1),dy(:,3),'--k')  

title('alu : color = incidence')
xlabel('intensity');
ylabel('error (m)');
ylim([-0.4, 0.1]);
%xlim([0, 14000]);


%% Iron angle

figure;
dInt = aggregateSinglePlate_angle(data_angle,'lms', 'iron', 'int');
dErr = aggregateSinglePlate_angle(data_angle,'lms', 'iron', 'err_d');
dInc = aggregateSinglePlate_angle(data_angle,'lms', 'iron', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dInc = dInc(dInt>0);

step = 10;

hold on;
scatter(dInt(1:step:end), dErr(1:step:end), 4, dInc(1:step:end));
% [dx, dy, dw] = statsPerBin(dInt(1:step:end), dErr(1:step:end), 50);
% plot(dx(:,1),dy(:,1),'--k')
% plot(dx(:,1),dy(:,2),'.k')
% plot(dx(:,1),dy(:,3),'--k')  

title('iron : color = incidence')
xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);



%% Steel angle

figure;
dInt = aggregateSinglePlate_angle(data_angle,'lms', 'steel', 'int');
dErr = aggregateSinglePlate_angle(data_angle,'lms', 'steel', 'err_d');
dInc = aggregateSinglePlate_angle(data_angle,'lms', 'steel', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dInc = dInc(dInt>0);

step = 10;

hold on;
scatter(dInt(1:step:end), dErr(1:step:end), 4, dInc(1:step:end));
% [dx, dy, dw] = statsPerBin(dInt(1:step:end), dErr(1:step:end), 50);
% plot(dx(:,1),dy(:,1),'--k')
% plot(dx(:,1),dy(:,2),'.k')
% plot(dx(:,1),dy(:,3),'--k')  

title('steel : color = incidence')
xlabel('intensity');
ylabel('error (m)');
ylim([-0.03, 0.07]);
%xlim([0, 14000]);