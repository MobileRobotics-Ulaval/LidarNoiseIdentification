%% load data
clear;
clc;
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/utm_corrAngle.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/utm_corrDist.mat';


%% Distance indoor
figure;
step = 1;
dataset = data_distance;
dInt = aggregateData_distance(dataset,'utm','indoor','int');
dErr = aggregateData_distance(dataset,'utm','indoor','err_d');
dDist = aggregateData_distance(dataset,'utm','indoor','d');
dInc = aggregateData_distance(dataset,'utm','indoor','inc');
dArea = aggregateData_distance(dataset,'utm','indoor','beamArea');


dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);
dInc = dInc(dInt>0);
dArea = dArea(dInt>0);

dInt = dInt(1:step:end);
dErr = dErr(1:step:end);
dDist = dDist(1:step:end);
dInc = dInc(1:step:end);
dArea = dArea(1:step:end);

scatter(dInt, dErr, 4, dInc);
hold on;
[dx, dy, dw] = statsPerBin(dInt, dErr, 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

% title('Indoor : color = distance')
% xlabel('intensity');
% ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);


%% Distance outdoor
figure;
dataset = utm_corrAngle;
% dataset = data_angle;
step = 1;
dInt = aggregateData_distance(dataset,'utm','outdoor','int');
dErr = aggregateData_distance(dataset,'utm','outdoor','err_d');
dDist = aggregateData_distance(dataset,'utm','outdoor','d');

dInt = dInt(1:step:end);
dErr = dErr(1:step:end);
dDist = dDist(1:step:end);

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);

hold on;
scatter(dInt, dErr, 4, dDist);
[dx, dy, dw] = statsPerBin(dInt, dErr, 100);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('Outdoor : color = distance')
xlabel('intensity');
ylabel('error (m)');
ylim([-0.1, 0.1]);
%xlim([0, 14000]);



%%
%Angles
figure;
step = 1;
dataset = data_angle;

aInt = aggregateData_angles(dataset,'utm','int');
aErr = aggregateData_angles(dataset,'utm','err_d');
%aDist = aggregateData_angles(dataset,'utm','d');
aInc = aggregateData_angles(dataset,'utm','inc');
aArea = aggregateData_angles(dataset,'utm','beamArea');
aInt = aInt(1:step:end);
aErr = aErr(1:step:end);
%aDist = aDist(1:step:end);
aInc = aInc(1:step:end);
aArea = aArea(1:step:end);
aInt = aInt(aInt>0);
aErr = aErr(aInt>0);
aInc = aInc(aInt>0);
aArea = aArea(aInt>0);


hold on;
scatter(aInt, aErr, 4, aInc);
[ax, ay, aw] = statsPerBin(aInt, aErr, 50);
% plot(ax(:,1),ay(:,1),'--k')
plot(ax(:,1),ay(:,2),'.k')
% plot(ax(:,1),ay(:,3),'--k') 

title('Indoor : color = incidence')
xlabel('intensity');
ylabel('error (m)');
% ylim([-0.1, 0.2]);
% xlim([0, 14000]);
