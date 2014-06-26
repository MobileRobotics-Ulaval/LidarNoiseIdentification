%% load data
clear;
clc;
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/utm_corrAngle.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/utm_corrDist.mat';

%% board Distance
figure;
% dataset = utm_corrDist;
dataset = data_distance;

int = aggregateSinglePlate_distance(dataset,'utm', 'board', 'indoor', 'int');
err = aggregateSinglePlate_distance(dataset,'utm', 'board', 'indoor', 'err_d');
dist = aggregateSinglePlate_distance(dataset,'utm', 'board', 'indoor', 'd');
inc = aggregateSinglePlate_distance(dataset,'utm', 'board', 'indoor', 'inc');
area = aggregateSinglePlate_distance(dataset, 'utm', 'board', 'indoor', 'beamArea');

int = int(int>0);
err = err(int>0);
dist = dist(int>0);
inc = inc(int>0);
area = area(int>0);
step = 1;

X = int;
Y = err;
Z = inc;

hold on;
scatter(X(1:step:end), Y(1:step:end), 4, Z(1:step:end));
[dx, dy, dw] = statsPerBin(X(1:step:end), Y(1:step:end), 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('board : Color = distance')
%xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);


%% alu Distance
figure;

%dataset = utm_corrDist;
dataset = data_distance;

int = aggregateSinglePlate_distance(dataset,'utm', 'alu', 'indoor', 'int');
err = aggregateSinglePlate_distance(dataset,'utm', 'alu', 'indoor', 'err_d');
dist = aggregateSinglePlate_distance(dataset,'utm', 'alu', 'indoor', 'd');
%inc = aggregateSinglePlate_distance(dataset,'utm', 'alu', 'indoor', 'inc');
area = aggregateSinglePlate_distance(dataset, 'utm', 'alu', 'indoor', 'beamArea');

int = int(int>0);
err = err(int>0);
dist = dist(int>0);
%inc = inc(int>0);
area = area(int>0);

step = 1;

hold on;
scatter(area(1:step:end), err(1:step:end), 4, dist(1:step:end));
[dx, dy, dw] = statsPerBin(area(1:step:end), err(1:step:end), 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('alu : Color = distance')
%xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);

%% iron Distance
figure;
dataset = utm_corrDist;
%dataset = data_distance;

int = aggregateSinglePlate_distance(dataset,'utm', 'iron', 'indoor', 'int');
err = aggregateSinglePlate_distance(dataset,'utm', 'iron', 'indoor', 'err_d');
dist = aggregateSinglePlate_distance(dataset,'utm', 'iron', 'indoor', 'd');
%inc = aggregateSinglePlate_distance(dataset,'utm', 'iron', 'indoor', 'inc');
area = aggregateSinglePlate_distance(dataset, 'utm', 'iron', 'indoor', 'beamArea');

int = int(int>0);
err = err(int>0);
dist = dist(int>0);
%inc = inc(int>0);
area = area(int>0);

step = 1;

hold on;
scatter(area(1:step:end), err(1:step:end), 4, dist(1:step:end));
[dx, dy, dw] = statsPerBin(area(1:step:end), err(1:step:end), 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('iron : Color = distance')
% xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);


%% steel Distance
figure;
dataset = data_distance;

int = aggregateSinglePlate_distance(dataset,'utm', 'steel', 'indoor', 'int');
err = aggregateSinglePlate_distance(dataset,'utm', 'steel', 'indoor', 'err_d');
dist = aggregateSinglePlate_distance(dataset,'utm', 'steel', 'indoor', 'd');
%inc = aggregateSinglePlate_distance(dataset,'utm', 'steel', 'indoor', 'inc');
area = aggregateSinglePlate_distance(dataset, 'utm', 'steel', 'indoor', 'beamArea');

int = int(int>0);
err = err(int>0);
dist = dist(int>0);
%inc = inc(int>0);
area = area(int>0);

step = 1;

hold on;
scatter(area(1:step:end), err(1:step:end), 4, dist(1:step:end));
[dx, dy, dw] = statsPerBin(area(1:step:end), err(1:step:end), 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('steel : Color = distance')
% xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);

%% Board angle
figure;

int = aggregateSinglePlate_angle(data_angle,'utm', 'board', 'int');
err = aggregateSinglePlate_angle(data_angle,'utm', 'board', 'err_d');
inc = aggregateSinglePlate_angle(data_angle,'utm', 'board', 'inc');

int = int(int>0);
err = err(int>0);
inc = inc(int>0);

step = 1;

hold on;
scatter(int(1:step:end), err(1:step:end), 4, inc(1:step:end));
[dx, dy, dw] = statsPerBin(int(1:step:end), err(1:step:end), 50);
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

int = aggregateSinglePlate_angle(data_angle,'utm', 'alu', 'int');
err = aggregateSinglePlate_angle(data_angle,'utm', 'alu', 'err_d');
inc = aggregateSinglePlate_angle(data_angle,'utm', 'alu', 'inc');
area = aggregateSinglePlate_angle(data_angle,'utm', 'alu', 'beamArea');


int = int(int>0);
err = err(int>0);
inc = inc(int>0);
area = area(int>0);
step = 1;

hold on;
scatter(int(1:step:end), err(1:step:end), 4, inc(1:step:end));
% [dx, dy, dw] = statsPerBin(inc(1:step:end), err(1:step:end), 50);
% plot(dx(:,1),dy(:,1),'--k')
% plot(dx(:,1),dy(:,2),'.k')
% plot(dx(:,1),dy(:,3),'--k')  

title('alu : color = intensity')
xlabel('beam area (m²)');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);


%% Iron angle
figure;

int = aggregateSinglePlate_angle(data_angle,'utm', 'iron', 'int');
err = aggregateSinglePlate_angle(data_angle,'utm', 'iron', 'err_d');
inc = aggregateSinglePlate_angle(data_angle,'utm', 'iron', 'inc');
px = aggregateSinglePlate_angle(data_angle,'utm', 'iron', 'px');


int = int(int>0);
err = err(int>0);
inc = inc(int>0);
px = px(int>0);

step = 1;

X = int;
Y = err;
Z = inc;

hold on;
scatter(X(1:step:end), Y(1:step:end), 4, Z(1:step:end));
[dx, dy, dw] = statsPerBin(X(1:step:end), Y(1:step:end), 50);
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

int = aggregateSinglePlate_angle(data_angle,'utm', 'steel', 'int');
err = aggregateSinglePlate_angle(data_angle,'utm', 'steel', 'err_d');
inc = aggregateSinglePlate_angle(data_angle,'utm', 'steel', 'inc');

int = int(int>0);
err = err(int>0);
inc = inc(int>0);
px = px(int>0);

step = 1;

X = int;
Y = err;
Z = inc;

hold on;
scatter(X(1:step:end), Y(1:step:end), 4, Z(1:step:end));
[dx, dy, dw] = statsPerBin(X(1:step:end), Y(1:step:end), 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('steel : color = intensity')
xlabel('incidence');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);
