%% load data

load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';

%% LMS outdoor distance

figure;
step = 1;
dInt = aggregateData_distance(data_distance,'lms','outdoor','int');
dErr = aggregateData_distance(data_distance,'lms','outdoor','err_d');
dDist = aggregateData_distance(data_distance,'lms','outdoor','d');
%dInc = aggregateData_distance(data_distance,'lms','outdoor','inc');

dInt = dInt(1:step:end);
dErr = dErr(1:step:end);
dDist = dDist(1:step:end);
%dInc = dInc(1:step:end);

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);
%dInc = dInc(dInt>0);

dInt = dInt(dInt<2000);
dErr = dErr(dInt<2000);
dDist = dDist(dInt<2000);
%dInc = dInc(dInt<2000);
hold on;

scatter(dInt, dErr, 4, dDist);
[dx, dy, dw] = statsPerBin(dInt, dErr, 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('Outdoor : color = distance')
xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);

%% LMS indoor angle

figure;
step = 1;

aInt = aggregateData_angles(data_angle,'lms','int');
aErr = aggregateData_angles(data_angle,'lms','err_d');
aInc = aggregateData_angles(data_angle,'lms','inc');

aInt = aInt(1:step:end);
aErr = aErr(1:step:end);
aInc = aInc(1:step:end);

aInt = aInt(aInt>0);
aErr = aErr(aInt>0);
aInc = aInc(aInt>0);

hold on;
scatter(aInt, aErr, 4, aInc);
[ax, ay, aw] = statsPerBin(aInt, aErr, 50);
plot(ax(:,1),ay(:,1),'--k')
plot(ax(:,1),ay(:,2),'.k')
plot(ax(:,1),ay(:,3),'--k')

title('Indoor : color = incidence')
xlabel('intensity');
ylabel('error (m)');
ylim([-0.4, 0.1]);
%xlim([0, 14000]);
