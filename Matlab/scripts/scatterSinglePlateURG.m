%% load data

load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';

%% board Distance

dInt = aggregateSinglePlate_distance(data_distance,'urg', 'board', 'indoor', 'int');
dErr = aggregateSinglePlate_distance(data_distance,'urg', 'board', 'indoor', 'err_d');
dDist = aggregateSinglePlate_distance(data_distance,'urg', 'board', 'indoor', 'd');
%dInc = aggregateSinglePlate_distance(data_distance,'urg', 'board', 'indoor', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);
%dInc = dInc(dInt>0);

step = 3;

hold on;
scatter(dInt(1:step:end), dErr(1:step:end), 4, dDist(1:step:end));
[dx, dy, dw] = statsPerBin(dInt(1:step:end), dErr(1:step:end), 50);
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
dInt = aggregateSinglePlate_distance(data_distance,'urg', 'alu', 'indoor', 'int');
dErr = aggregateSinglePlate_distance(data_distance,'urg', 'alu', 'indoor', 'err_d');
dDist = aggregateSinglePlate_distance(data_distance,'urg', 'alu', 'indoor', 'd');
%dInc = aggregateSinglePlate_distance(data_distance,'urg', 'alu', 'indoor', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);
%dInc = dInc(dInt>0);

step = 10;

hold on;
scatter(dInt(1:step:end), dErr(1:step:end), 4, dDist(1:step:end));
[dx, dy, dw] = statsPerBin(dInt(1:step:end), dErr(1:step:end), 50);
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

dInt = aggregateSinglePlate_distance(data_distance,'urg', 'iron', 'indoor', 'int');
dErr = aggregateSinglePlate_distance(data_distance,'urg', 'iron', 'indoor', 'err_d');
dDist = aggregateSinglePlate_distance(data_distance,'urg', 'iron', 'indoor', 'd');
%dInc = aggregateSinglePlate_distance(data_distance,'urg', 'iron', 'indoor', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);
%dInc = dInc(dInt>0);

step = 10;

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

dInt = aggregateSinglePlate_distance(data_distance,'urg', 'steel', 'indoor', 'int');
dErr = aggregateSinglePlate_distance(data_distance,'urg', 'steel', 'indoor', 'err_d');
dDist = aggregateSinglePlate_distance(data_distance,'urg', 'steel', 'indoor', 'd');
%dInc = aggregateSinglePlate_distance(data_distance,'urg', 'steel', 'indoor', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);
%dInc = dInc(dInt>0);

step = 10;

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

