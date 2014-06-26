clear;
clc;
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/lms_corrAngle.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/lms_corrDist.mat';

%% lms indoor alu : error vs distance

plate = 'alu';
sensor = 'lms';
dataset = data_angle;

varX = 'd';
varY = 'err_d';
path = dataset.(sensor).indoor.(plate);

figure;
plot(path.a0.result.(varX), path.a0.result.(varY), '.k',...
     path.a15.result.(varX), path.a15.result.(varY), '.r',...
     path.a30.result.(varX), path.a30.result.(varY), '.g',...
     path.a45.result.(varX), path.a45.result.(varY), '.b',...
     path.a60.result.(varX), path.a60.result.(varY), '.y',...
     path.a75.result.(varX), path.a75.result.(varY), '.c')
 
      
 
 title('lms indoor/outdoor (intensity corrected) : steel plate', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('distance (m)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);
legend('0°','15°','30°','45°','60°','75°')

%% lms all plates 75 degree : error vs horizontal position on the plate

sensor = 'lms';
dataset = data_angle;

varX = 'd';
varY = 'err_d';
path = dataset.(sensor).indoor;
angle = 'a75';

figure;
plot(path.board.(angle).result.(varX), path.board.(angle).result.(varY), '.k',...
     path.alu.(angle).result.(varX), path.alu.(angle).result.(varY), '.r',...
     path.iron.(angle).result.(varX), path.iron.(angle).result.(varY), '.g',...
     path.steel.(angle).result.(varX), path.steel.(angle).result.(varY), '.b')
 

title('lms indoor/outdoor : all plates, 75 degree', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('distance (m)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);
legend('board','alu','iron','steel')


%% analyse all datasets

datasetD = data_distance;
datasetA = data_angle;

int = aggregateAllDatasets(datasetD, datasetA, 'lms', 'outdoor', 'int');
err = aggregateAllDatasets(datasetD, datasetA, 'lms', 'outdoor', 'err_d');
dist = aggregateAllDatasets(datasetD, datasetA, 'lms', 'outdoor', 'd');
inc = aggregateAllDatasets(datasetD, datasetA, 'lms', 'outdoor', 'inc');
beamArea = aggregateAllDatasets(datasetD, datasetA, 'lms', 'outdoor', 'beamArea');

% filters
step = 1;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
inc = inc(int>0);
beamArea = beamArea(int>0);
int = int(int<2000); % because 1 point at 4000
err = err(int<2000);
dist = dist(int<2000);
inc = inc(int<2000);
beamArea = beamArea(int<2000);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);
inc = inc(1:step:end);
beamArea = beamArea(1:step:end);

figure;
scatter(dist, err, 4, dist);
hold on;
[dx, dy, dw] = statsPerBin(dist, err, 50);
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
