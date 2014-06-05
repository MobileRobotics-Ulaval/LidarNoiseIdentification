clear;
clc;
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/utm_corrAngle.mat';

%% UTM indoor alu : error vs incidence

plate = 'steel';
sensor = 'utm';
%dataSet = data_angle;
%dataSet = utm_corrAngle;
dataSet = corrAngleWithArea;

varX = 'inc';
varY = 'err_d';
path = dataSet.(sensor).indoor.(plate);

figure;
plot(path.a0.result.(varX), path.a0.result.(varY), '.k',...
     path.a15.result.(varX), path.a15.result.(varY), '.r',...
     path.a30.result.(varX), path.a30.result.(varY), '.g',...
     path.a45.result.(varX), path.a45.result.(varY), '.b',...
     path.a60.result.(varX), path.a60.result.(varY), '.y',...
     path.a75.result.(varX), path.a75.result.(varY), '.c')
 
      
 
 title('UTM indoor (intensity corrected) : steel plate', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('incidence (rad)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
ylim([-0.1, 0.4])
set(gca, 'Fontsize', 15);
legend('0°','15°','30°','45°','60°','75°')

%% UTM all plates 75 degree : error vs horizontal position on the plate

sensor = 'utm';
%dataSet = data_angle;
%dataSet = utm_corrAngle;
dataSet = corrAngleWithArea;

varX = 'inc';
varY = 'err_d';
path = dataSet.(sensor).indoor;
angle = 'a0';

figure;
plot(path.board.(angle).result.(varX), path.board.(angle).result.(varY), '.k',...
     path.alu.(angle).result.(varX), path.alu.(angle).result.(varY), '.r',...
     path.iron.(angle).result.(varX), path.iron.(angle).result.(varY), '.g',...
     path.steel.(angle).result.(varX), path.steel.(angle).result.(varY), '.b')
 
hold on;
step = 1;
allInt = aggregateData_angles(corrAngleWithArea, 'utm', 'int');
allInt = allInt(allInt>0);
allInt = allInt(1:step:end);
allErr = aggregateData_angles(corrAngleWithArea, 'utm', 'err_d');
allErr = allErr(allInt>0);
allErr = allErr(1:step:end);
allInc = aggregateData_angles(corrAngleWithArea, 'utm', 'inc');
allInc = allInc(allInt>0);
allInc = allInc(1:step:end);
allD = aggregateData_angles(corrAngleWithArea, 'utm', 'd');
allD = allD(allInt>0);
allD = allD(1:step:end);

[x_hat, y_hat, w] = statsPerBin(allInc, allErr, 50);
% plot(x_hat(:,2), y_hat(:,2), '.k')

title('UTM indoor (intensity corrected) : all plates, 0 degree', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('incidence (rad)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);
legend('board','alu','iron','steel')


%% analyse all angle

figure;
scatter(allInc, allErr, 4, allD)
hold on;
plot(x_hat(:,2),y_hat(:,2), '.k')

title('UTM indoor (intensity corrected): all plates, color = distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('incidence (rad)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);
