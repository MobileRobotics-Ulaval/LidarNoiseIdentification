clear; clc;
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';

%%

% 
%                                                           A'_,-'
%                                                         _,-|
%                                                   A _,-'   |
%                                                 _,o'       |
%                                             _,-'   \       |
%                                         _,-'        \      |b
%                                     _,-'             \ x   |
%                                 _,-'                  \    |
%                             _,-'                       \   |
%                         _,-'alpha                  beta \B |B"
%              Source S o----------------------------------o-o---------
%                         `-. alpha         d       (y-x)/2 \|w
%                             `-._                           o B'
%                                 `-._                       |\
%                                     `-._                   | \
%                                         `-._           b-w |  \
%                                             `-._           |   \ (y+x)/2
%                                                 `-._       |    \
%                                                     `-._   |     \
%                                                         `-.|      \
%                                                           C'`-._   \
%                                                                 `-._\
%                                                                     `o
%  http://mathforum.org/library/drmath/view/55260.html                  C



%% err vs d-d' 

int = aggregateAllDatasets(data_distance, data_angle, 'utm', 'indoor', 'int');
err = aggregateAllDatasets(data_distance, data_angle,'utm', 'indoor', 'err_d');
dist = aggregateAllDatasets(data_distance, data_angle,'utm', 'indoor', 'd');
inc = aggregateAllDatasets(data_distance, data_angle,'utm', 'indoor', 'inc');

% filters
step = 1;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
inc = inc(int>0);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);
inc = inc(1:step:end);

% (distance chosen with max int)
beta = pi/2 - inc;
alpha = 0.0012217;
maxErr = (dist + err) - (sin(beta).*(dist + err))./sin(pi - beta - alpha);

% distance chosen with center of mass
x = (dist + err).*sin(alpha)./sin(beta+alpha);
y = (dist + err).*sin(alpha)./sin(beta-alpha);
centroid = 2.*(x+y)./3;
xPrime = centroid - y;
chosenDist = sqrt((dist+err).^2 + xPrime.^2 -2.*(dist+err).*xPrime.*cos(beta));
centroidErr = (dist + err) - chosenDist;

figure;
scatter(centroidErr, err, 4, dist);
hold on;
[dx, dy, dw] = statsPerBin(centroidErr, err, 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('UTM indoor : color = incidence', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('error on chosen distance (m)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
% set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);

% ylim([-0.15, 0.2]);


%%
plate = 'iron';
sensor = 'lms';
dataSet = data_distance;

varX = 'd';
varY = 'int';
path = dataSet.(sensor).outdoor.(plate);

% record = {'a0', 'a15','a30','a45','a60','a75'};
color = {'.r', '.b', '.y', '.m', '.k', '.g'};

record = {'d0_2','d1_0','d2_0','d4_0','d8_0'};

dmin = 0.1;
dmax = 0.12;

figure;
hold on
for i = 1:length(record)
    if(isfield(path, record{i}))
        filter = path.(record{i}).result.inc > dmin & path.(record{i}).result.inc < dmax;
        plot(path.(record{i}).result.(varX)(filter), path.(record{i}).result.(varY)(filter), color{i})
    end
end
   
title(['UTM indoor: ', plate, ' plate'], 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('distance (m)','Fontsize',15, 'Fontweight', 'demi');
ylabel('intensity', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);
legend(record)


%% general plot int vs dist

figure;
dInt = aggregateData_distance(data_distance, 'utm', 'outdoor', 'int');
dDist = aggregateData_distance(data_distance, 'utm', 'outdoor', 'd');
dInc = aggregateData_distance(data_distance, 'utm', 'outdoor', 'inc');

dFilter = dInc > 0.1 & dInc < 0.12;
filtDist = dDist(dFilter);
filtInt = dInt(dFilter);
plot(filtDist, filtInt, '.b')

%% fittings

% all plates : -14.78x² - 437.1x + 2350
% board : 22.51x² - 371.9x + 2231
% alu : 141.4x² - 786.1x + 2593
% steel : 42.37x² - 498.7x + 2190
% iron : 22.06x² - 498.5x + 3007

figure;
hold on;    
x = (0:0.1:50);

plot(x, -4.962.*x.^2 - 231.6.*x + 2881, 'k') 
plot(x, 7.597.*x.^2 - 269.7.*x + 3090, 'b')
plot(x, 39.75.*x.^2 - 654.1.*x + 4191, 'r')
plot(x, 21.35.*x.^2 - 454.9.*x + 3145, 'g')
plot(x, 22.06.*x.^2 - 498.5.*x + 3007, 'm')

title('UTM intensity VS distance (0.1 < inc < 0.12)', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('distance (m)','Fontsize',15, 'Fontweight', 'demi');
ylabel('intensity', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);
legend('all plates', 'board', 'alu', 'steel', 'iron');

%% single plate plot int vs dist

figure;
hold on;
sensor = 'lms';
plate = 'iron';
plateDist = aggregateSinglePlate_distance(data_distance, sensor, plate,  'outdoor', 'd');
plateInt = aggregateSinglePlate_distance(data_distance, sensor, plate,  'outdoor', 'int');
plateInc = aggregateSinglePlate_distance(data_distance, sensor, plate,  'outdoor', 'inc');

plateFilter = plateInc > 0.1 & plateInc < 0.12;
pfDist = plateDist(plateFilter);
pfInt = plateInt(plateFilter);

plot(pfDist, pfInt, '.b')

% [dx, dy, dw] = statsPerBin(pfDist, pfInt, 50);
% medX = dx(:,2);
% medY = dy(:,2);
% plot(medX, medY, '.r')

%% intensity vs horizontal distance (angle dataset)

angle = 'a75';
plate = 'iron';
px = data_angle.lms.indoor.(plate).(angle).result.px;
int = data_angle.lms.indoor.(plate).(angle).result.int;

figure;
plot(px, int, '.b')
hold on;
[dx, dy, dw] = statsPerBin(px, int, 20);
medX = dx(:,2);
medY = dy(:,2);
plot(medX, medY, '.k')
