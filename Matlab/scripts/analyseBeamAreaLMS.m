clear;
clc;
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/lms_corrAngle.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/lms_corrDist.mat';

%% LMS indoor/outdoor single plate all angle

plate = 'alu';
sensor = 'lms';
% dataSet = data_angle;
dataSet = lms_corrAngle;

varX = 'beamArea';
varY = 'err_d';
path = dataSet.(sensor).indoor.(plate);

figure;
plot(path.a0.result.(varX), path.a0.result.(varY), '.k',...
     path.a15.result.(varX), path.a15.result.(varY), '.r',...
     path.a30.result.(varX), path.a30.result.(varY), '.g',...
     path.a45.result.(varX), path.a45.result.(varY), '.b',...
     path.a60.result.(varX), path.a60.result.(varY), '.y',...
     path.a75.result.(varX), path.a75.result.(varY), '.c')
 
      
 
 title('LMS indoor/outdoor (intensity corrected) : aluminum plate', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('beam area (m²)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
% ylim([-0.1, 0.4])
set(gca, 'Fontsize', 15);
legend('0°','15°','30°','45°','60°','75°')

%% UTM all plates 75 degree

sensor = 'lms';
dataset = data_angle;
% dataSet = lms_corrAngle;

varX = 'beamArea';
varY = 'err_d';
path = dataset.(sensor).indoor;
angle = 'a75';

figure;
plot(path.board.(angle).result.(varX), path.board.(angle).result.(varY), '.k',...
     path.alu.(angle).result.(varX), path.alu.(angle).result.(varY), '.r',...
     path.iron.(angle).result.(varX), path.iron.(angle).result.(varY), '.g',...
     path.steel.(angle).result.(varX), path.steel.(angle).result.(varY), '.b')
 
hold on;
step = 1;
allInt = aggregateData_angles(dataset, 'lms', 'int');
allInt = allInt(allInt>0);
allInt = allInt(1:step:end);
allErr = aggregateData_angles(dataset, 'lms', 'err_d');
allErr = allErr(allInt>0);
allErr = allErr(1:step:end);
allArea = aggregateData_angles(dataset, 'lms', 'beamArea');
allArea = allArea(allInt>0);
allArea = allArea(1:step:end);
allD = aggregateData_angles(dataset, 'lms', 'd');
allD = allD(allInt>0);
allD = allD(1:step:end);
allInc = aggregateData_angles(dataset, 'lms', 'inc');
allInc = allInc(allInt>0);
allInc = allInc(1:step:end);

title('LMS indoor/outdoor (intensity corrected) : all plates, 75 degree', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('beam area (m²)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);
legend('board','alu','iron','steel')


%% analyse beam area : distance dataset

figure;
% dataset = data_distance;
dataset = lms_corrDist;

areaD = aggregateData_distance(dataset, 'lms', 'outdoor', 'beamArea');
errD = aggregateData_distance(dataset,'lms', 'outdoor', 'err_d');
distD = aggregateData_distance(dataset,'lms', 'outdoor', 'd');
intD = aggregateData_distance(dataset, 'lms', 'outdoor', 'int');
incD = aggregateData_distance(dataset, 'lms', 'outdoor', 'inc');

% filters
step = 1;
intD = intD(intD>0);
intD = intD(1:step:end);
areaD = areaD(intD>0);
errD = errD(intD>0);
distD = distD(intD>0);
areaD = areaD(1:step:end);
errD = errD(1:step:end);
distD = distD(1:step:end);
incD = incD(intD>0);
incD = incD(1:step:end);


scatter(areaD, errD, 4, distD);
hold on;
[x_hat, y_hat, dw] = statsPerBin(areaD, errD, 50);
plot(x_hat(:,2),y_hat(:,2), '.k')

title('LMS indoor/outdoor (intensity corrected): distance dataset, color = distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('beam area (m²)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);

%% analyse beam area : angle dataset

figure;
dataset = lms_corrAngle;

areaA = aggregateData_angles(dataset, 'lms', 'beamArea');
errA = aggregateData_angles(dataset,'lms', 'err_d');
distA = aggregateData_angles(dataset,'lms', 'd');
intA = aggregateData_angles(dataset, 'lms', 'int');
incA = aggregateData_angles(dataset, 'lms', 'inc');

% filters
step = 1;
intA = intA(intA>0);
intA = intA(1:step:end);
areaA = areaA(intA>0);
errA = errA(intA>0);
distA = distA(intA>0);
areaA = areaA(1:step:end);
errA = errA(1:step:end);
distA = distA(1:step:end);
incA = incA(intA>0);
incA = incA(1:step:end);

scatter(areaA, errA, 4, distA);
hold on;
[x_hat, y_hat, dw] = statsPerBin(areaA, errA, 50);
plot(x_hat(:,2),y_hat(:,2), '.k')

title('UTM indoor (intensity corrected): angle dataset, color = distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('beam area (m²)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);


%% allDatasets

figure;

% datasetD = lms_corrDist;
% datasetA = lms_corrAngle;
datasetD = data_distance;
datasetA = data_angle;

int = aggregateAllDatasets(datasetD, datasetA, 'lms', 'outdoor', 'int');
area = aggregateAllDatasets(datasetD, datasetA, 'lms', 'outdoor', 'beamArea');
err = aggregateAllDatasets(datasetD, datasetA,'lms', 'outdoor', 'err_d');
dist = aggregateAllDatasets(datasetD, datasetA,'lms', 'outdoor', 'd');
inc = aggregateAllDatasets(datasetD, datasetA, 'lms', 'outdoor', 'inc');

% filters
step = 3;
area = area(int>0);
err = err(int>0);
dist = dist(int>0);
inc = inc(int>0);
int = int(int>0);
area = area(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);
int = int(1:step:end);
inc = inc(1:step:end);

scatter(area, err, 4, dist);
hold on;
[dx, dy, dw] = statsPerBin(area, err, 50);
plot(dx(:,2), dy(:,2), '.k')

title('LMS indoor/outdoor (intensity NOT corrected): all plates, color = distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('beam area (m²)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);
