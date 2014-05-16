%% load data

load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';

%% board Distance

dInt = aggregateSinglePlate_distance(data_distance,'utm', 'board', 'indoor', 'int');
dErr = aggregateSinglePlate_distance(data_distance,'utm', 'board', 'indoor', 'err_d');
dDist = aggregateSinglePlate_distance(data_distance,'utm', 'board', 'indoor', 'd');
%dInc = aggregateSinglePlate_distance(data_distance,'utm', 'board', 'indoor', 'inc');

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

title('board : Color = distance')
xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);


%% alu Distance
figure;
dInt = aggregateSinglePlate_distance(data_distance,'utm', 'alu', 'indoor', 'int');
dErr = aggregateSinglePlate_distance(data_distance,'utm', 'alu', 'indoor', 'err_d');
dDist = aggregateSinglePlate_distance(data_distance,'utm', 'alu', 'indoor', 'd');
%dInc = aggregateSinglePlate_distance(data_distance,'utm', 'alu', 'indoor', 'inc');

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

dInt = aggregateSinglePlate_distance(data_distance,'utm', 'iron', 'indoor', 'int');
dErr = aggregateSinglePlate_distance(data_distance,'utm', 'iron', 'indoor', 'err_d');
dDist = aggregateSinglePlate_distance(data_distance,'utm', 'iron', 'indoor', 'd');
%dInc = aggregateSinglePlate_distance(data_distance,'utm', 'iron', 'indoor', 'inc');

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

dInt = aggregateSinglePlate_distance(data_distance,'utm', 'steel', 'indoor', 'int');
dErr = aggregateSinglePlate_distance(data_distance,'utm', 'steel', 'indoor', 'err_d');
dDist = aggregateSinglePlate_distance(data_distance,'utm', 'steel', 'indoor', 'd');
%dInc = aggregateSinglePlate_distance(data_distance,'utm', 'steel', 'indoor', 'inc');

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

%% Board angle

dInt = aggregateSinglePlate_angle(data_angle,'utm', 'board', 'int');
dErr = aggregateSinglePlate_angle(data_angle,'utm', 'board', 'err_d');
dInc = aggregateSinglePlate_angle(data_angle,'utm', 'board', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dInc = dInc(dInt>0);

step = 10;

hold on;
scatter(dInt(1:step:end), dErr(1:step:end), 4, dInc(1:step:end));
[dx, dy, dw] = statsPerBin(dInt(1:step:end), dErr(1:step:end), 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('board : color = incidence')
xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);


%% Alu angle

dInt = aggregateSinglePlate_angle(data_angle,'utm', 'alu', 'int');
dErr = aggregateSinglePlate_angle(data_angle,'utm', 'alu', 'err_d');
dInc = aggregateSinglePlate_angle(data_angle,'utm', 'alu', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dInc = dInc(dInt>0);

step = 10;

hold on;
scatter(dInt(1:step:end), dErr(1:step:end), 4, dInc(1:step:end));
[dx, dy, dw] = statsPerBin(dInt(1:step:end), dErr(1:step:end), 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('alu : color = incidence')
xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);


%% Iron angle

dInt = aggregateSinglePlate_angle(data_angle,'utm', 'iron', 'int');
dErr = aggregateSinglePlate_angle(data_angle,'utm', 'iron', 'err_d');
dInc = aggregateSinglePlate_angle(data_angle,'utm', 'iron', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dInc = dInc(dInt>0);

step = 10;

hold on;
scatter(dInt(1:step:end), dErr(1:step:end), 4, dInc(1:step:end));
[dx, dy, dw] = statsPerBin(dInt(1:step:end), dErr(1:step:end), 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('iron : color = incidence')
xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);



%% Steel angle

dInt = aggregateSinglePlate_angle(data_angle,'utm', 'steel', 'int');
dErr = aggregateSinglePlate_angle(data_angle,'utm', 'steel', 'err_d');
dInc = aggregateSinglePlate_angle(data_angle,'utm', 'steel', 'inc');

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dInc = dInc(dInt>0);

step = 10;

hold on;
scatter(dInt(1:step:end), dErr(1:step:end), 4, dInc(1:step:end));
[dx, dy, dw] = statsPerBin(dInt(1:step:end), dErr(1:step:end), 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('steel : color = incidence')
xlabel('intensity');
ylabel('error (m)');
%ylim([-0.1, 0.1]);
%xlim([0, 14000]);
