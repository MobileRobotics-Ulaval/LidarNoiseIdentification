clear; clc;
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/utm_corrDist.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/utm_corrAngle.mat';


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



%% pondered/sampled err vs d-d' 

% dataD = data_distance;
% dataA = data_angle;
dataD = utm_corrDist;
dataA = utm_corrAngle;

int = aggregateAllDatasets(dataD, dataA, 'utm', 'indoor', 'int');
err = aggregateAllDatasets(dataD, dataA,'utm', 'indoor', 'err_d');
dist = aggregateAllDatasets(dataD, dataA,'utm', 'indoor', 'd');
inc = aggregateAllDatasets(dataD, dataA,'utm', 'indoor', 'inc');

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

figure;
hist(inc);
figure;
hist(dist);

% sampling random data
step = 20;

distLow = dist(dist <= 2.5);
distHigh = dist(dist > 2.5);
distLow = distLow(1:step:end);
distSampled = [distLow ; distHigh];

incLow = inc(dist <= 2.5);
incHigh = inc(dist > 2.5);
incLow = incLow(1:step:end);
incSampled = [incLow ; incHigh];

errLow = err(dist <= 2.5);
errHigh = err(dist > 2.5);
errLow = errLow(1:step:end);
errSampled = [errLow ; errHigh];

inc = incSampled;
err = errSampled;
dist = distSampled;

figure;
hist(incSampled);

figure;
hist(distSampled);

% (distance chosen with max int)
beta = pi/2 - inc;

%good one
halfOpeningAngle = 0.0012217;

% test
% openingAngle = 0.006;


% distance chosen with max int value

% radiusDist = (cos(inc).*(dist + err))./cos(inc - openingAngle);
% maxErr = (dist + err) - radiusDist;
radiusDist = (cos(inc).*(dist))./cos(inc - halfOpeningAngle);
maxErr = (dist) - radiusDist;


% distance chosen with centroid (triangle approx.)

% x = (dist + err).*sin(openingAngle)./sin(beta+openingAngle);
% y = (dist + err).*sin(openingAngle)./sin(beta-openingAngle);
% centroid = 2.*(x+y)./3;
% xPrime = centroid - y;
% chosenDist = sqrt((dist+err).^2 + xPrime.^2 -2.*(dist+err).*xPrime.*cos(beta));
% centroidErr = (dist + err) - chosenDist;
x = (dist).*sin(halfOpeningAngle)./sin(beta+halfOpeningAngle);
y = (dist).*sin(halfOpeningAngle)./sin(beta-halfOpeningAngle);
centroid = 2.*(x+y)./3;
xPrime = centroid - y;
chosenDist = sqrt((dist).^2 + xPrime.^2 -2.*(dist).*xPrime.*cos(beta));
centroidErr = (dist) - chosenDist;



% distance chosen with centroid (beer-lambert approx)
% test = exp(((dist + err) - (cos(inc).*(dist + err))./cos(inc - alpha)));


% varX = maxErr;
% varX = centroidErr;


% figure;
% hist(centroidSampled);
% title('UTM indoor : distribution of sampled distance bias', 'Fontsize', 15, 'Fontweight', 'demi')
% xlabel('distance bias (m)','Fontsize',15, 'Fontweight', 'demi');
% ylabel('frequency', 'Fontsize', 15, 'Fontweight', 'demi');
% set(gca, 'Fontsize', 15);

varX = maxErr;

figure;
scatter(varX, err, 4, inc);
hold on;
[dx, dy, dw] = statsPerBin(varX, err, 25);
% plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
% plot(dx(:,1),dy(:,3),'--k')  

title('UTM indoor sampled data: color = incidence', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('distance bias (m)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
% set(gca, 'XTick', (0:0.05:max(varX)));
set(gca, 'Fontsize', 15);
% xlim([0, max(varX)])
% ylim([-0.15, 0.2]);


%% raw err vs d-d'

% dataD = data_distance;
% dataA = data_angle;
dataD = utm_corrDist;
dataA = utm_corrAngle;

int = aggregateAllDatasets(dataD, dataA, 'utm', 'indoor', 'int');
err = aggregateAllDatasets(dataD, dataA,'utm', 'indoor', 'err_d');
dist = aggregateAllDatasets(dataD, dataA,'utm', 'indoor', 'd');
inc = aggregateAllDatasets(dataD, dataA,'utm', 'indoor', 'inc');

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
halfOpeningAngle = 0.0012217;
radiusDist = (cos(inc).*(dist + err))./cos(inc - halfOpeningAngle);
maxErr = (dist + err) - radiusDist;

% distance chosen with centroid (triangle approx.)
x = (dist + err).*sin(halfOpeningAngle)./sin(beta+halfOpeningAngle);
y = (dist + err).*sin(halfOpeningAngle)./sin(beta-halfOpeningAngle);
centroid = 2.*(x+y)./3;
xPrime = centroid - y;
chosenDist = sqrt((dist+err).^2 + xPrime.^2 -2.*(dist+err).*xPrime.*cos(beta));
centroidErr = (dist + err) - chosenDist;

figure;
scatter(centroidErr, err, 4, inc);
hold on;
[dx, dy, dw] = statsPerBin(centroidErr, err, 50);
% plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
% plot(dx(:,1),dy(:,3),'--k')  

title('UTM indoor : color = incidence', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('distance bias (m)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
% set(gca, 'XTick', (0:0.05:max(varX)));
set(gca, 'Fontsize', 15);
% xlim([0, max(varX)])
% ylim([-0.15, 0.2]);

% %% distance bias vs inc 
% 
% % dataD = data_distance;
% % dataA = data_angle;
% dataD = utm_corrDist;
% dataA = utm_corrAngle;
% 
% int = aggregateAllDatasets(dataD, dataA, 'utm', 'indoor', 'int');
% err = aggregateAllDatasets(dataD, dataA,'utm', 'indoor', 'err_d');
% dist = aggregateAllDatasets(dataD, dataA,'utm', 'indoor', 'd');
% inc = aggregateAllDatasets(dataD, dataA,'utm', 'indoor', 'inc');
% 
% % filters
% step = 1;
% int = int(int>0);
% err = err(int>0);
% dist = dist(int>0);
% inc = inc(int>0);
% int = int(1:step:end);
% err = err(1:step:end);
% dist = dist(1:step:end);
% inc = inc(1:step:end);
% 
% % (distance chosen with max int)
% beta = pi/2 - inc;
% openingAngle = 0.0012217;
% maxErr = (dist + err) - (cos(inc).*(dist + err))./cos(inc - openingAngle);
% 
% varX = maxErr;
% 
% figure;
% scatter(inc, varX, 4, dist);
% hold on;
% % [dx, dy, dw] = statsPerBin(varX, err, 50);
% % plot(dx(:,1),dy(:,1),'--k')
% % plot(dx(:,1),dy(:,2),'.k')
% % plot(dx(:,1),dy(:,3),'--k')  
% 
% title('UTM indoor : color = distance', 'Fontsize', 15, 'Fontweight', 'demi')
% xlabel('incidence (rad)','Fontsize',15, 'Fontweight', 'demi');
% ylabel('distance bias (m)', 'Fontsize', 15, 'Fontweight', 'demi');
% % set(gca, 'XTick', (0:0.05:max(varX)));
% set(gca, 'Fontsize', 15);
% % xlim([0, max(varX)])
% % ylim([-0.15, 0.2]);

%% Intensity variation vs distance, incidence

% vérifier si les gaussiennes devraient toujours être centrées à 0 rad 

% dataD = data_distance;
% dataA = data_angle;

record =  {'75°', '60°', '45°', '30°', '15°', '0°'};
record2 =  {'70°','63°','56°','49°','42°','35°', '28°', '21°', '14°', '7°', '0°'};



sensorHalfAngle = 0.0012217;

beta = @(inc) pi/2 - inc;

% voir figure en haut pour x et y
x = @(inc, dist) ((dist).*sin(sensorHalfAngle)./sin(beta(inc)+sensorHalfAngle));
y = @(inc, dist) (-(dist).*sin(sensorHalfAngle)./sin(beta(inc)-sensorHalfAngle));
mu = @(inc, dist) ((x(inc, dist)+y(inc, dist))/2);
sigma = @(inc, dist) ((abs(x(inc, dist)) + abs(y(inc, dist)))/6);


% distFunction = (cos(inc).*(dist))./cos(inc - alpha);
% normFunction = exp((-(alpha-mu).^2)./(2.*sigma.^2)) ./ (sqrt(2*pi).*sigma);

distanceFunction = @(alpha, inc, dist) ((cos(inc).*(dist))./cos(inc - alpha));
intensityFunction = @(alpha, inc, dist) ((-(distanceFunction(alpha, inc, dist))));
backscatterFunction = @(alpha, inc, dist) (exp(-((alpha-mu(inc, dist)).^2)./(2.*sigma(inc, dist).^2)) ./ (sqrt(2*pi).*sigma(inc, dist)));

% returnIntensity = @(alpha, inc, dist) (intensityFunction(alpha, inc, dist)) .* (backscatterFunction(alpha, inc, dist));

normalized = @(x) ((x - min(x))./max((x - min(x))));

returnedIntensity = @(alpha, inc, dist) normalized(intensityFunction(alpha, inc, dist)) .* normalized(backscatterFunction(alpha, inc, dist));


dist = 2;
vectorAlpha = (-0.00122:0.000001:0.00122);

figure;
hold on
inc = 0;
plot(normalized(distanceFunction(vectorAlpha, inc, dist)), normalized(intensityFunction(vectorAlpha, inc, dist)), 'r')
title('intensity vs distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('distance','Fontsize',15, 'Fontweight', 'demi');
ylabel('intensity', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);


figure;
hold on
inc = 0.2618*5;
plot(vectorAlpha, normalized(distanceFunction(vectorAlpha, inc, dist)), 'm')
inc = 0.2618*4;
plot(vectorAlpha, normalized(distanceFunction(vectorAlpha, inc, dist)), 'k')
inc = 0.2618*3;
plot(vectorAlpha, normalized(distanceFunction(vectorAlpha, inc, dist)), 'y')
inc = 0.2618*2;
plot(vectorAlpha, normalized(distanceFunction(vectorAlpha, inc, dist)), 'b')
inc = 0.2618*1;
plot(vectorAlpha, normalized(distanceFunction(vectorAlpha, inc, dist)), 'g')
inc = 0.0;
plot(vectorAlpha, normalized(distanceFunction(vectorAlpha, inc, dist)), 'r')
title('distance for different incidence angle', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('opening angle','Fontsize',15, 'Fontweight', 'demi');
ylabel('distance', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);

figure;
hold on
inc = 0.2618*5;
plot(vectorAlpha, normalized(intensityFunction(vectorAlpha, inc, dist)), 'm')
inc = 0.2618*4;
plot(vectorAlpha, normalized(intensityFunction(vectorAlpha, inc, dist)), 'k')
inc = 0.2618*3;
plot(vectorAlpha, normalized(intensityFunction(vectorAlpha, inc, dist)), 'y')
inc = 0.2618*2;
plot(vectorAlpha, normalized(intensityFunction(vectorAlpha, inc, dist)), 'b')
inc = 0.2618*1;
plot(vectorAlpha, normalized(intensityFunction(vectorAlpha, inc, dist)), 'g')
inc = 0.0;
plot(vectorAlpha, normalized(intensityFunction(vectorAlpha, inc, dist)), 'r')
title('intensity for different incidence angle', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('opening angle','Fontsize',15, 'Fontweight', 'demi');
ylabel('intensity', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);

figure;
hold on
inc = 0.2618*5;
plot(vectorAlpha, normalized(backscatterFunction(vectorAlpha, inc, dist)), 'm')
inc = 0.2618*4;
plot(vectorAlpha, normalized(backscatterFunction(vectorAlpha, inc, dist)), 'k')
inc = 0.2618*3;
plot(vectorAlpha, normalized(backscatterFunction(vectorAlpha, inc, dist)), 'y')
inc = 0.2618*2;
plot(vectorAlpha, normalized(backscatterFunction(vectorAlpha, inc, dist)), 'b')
inc = 0.2618;
plot(vectorAlpha, normalized(backscatterFunction(vectorAlpha, inc, dist)), 'g')
inc = 0.0;
plot(vectorAlpha, normalized(backscatterFunction(vectorAlpha, inc, dist)), 'r')
title('gaussian beam intensity', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('opening angle', 'Fontsize', 15, 'Fontweight', 'demi');
ylabel('intensity', 'Fontsize', 15, 'Fontweight', 'demi');
legend(record)
set(gca, 'Fontsize', 15);


figure;
hold on
inc = 0.13*10;
plot(vectorAlpha, normalized(returnedIntensity(vectorAlpha, inc, dist)), 'm')
inc = 0.13*9;
plot(vectorAlpha, normalized(returnedIntensity(vectorAlpha, inc, dist)), 'k')
inc =0.13*8;
plot(vectorAlpha, normalized(returnedIntensity(vectorAlpha, inc, dist)), 'y')
inc =0.13*7;
plot(vectorAlpha, normalized(returnedIntensity(vectorAlpha, inc, dist)), 'b')
inc = 0.13*6;
plot(vectorAlpha, normalized(returnedIntensity(vectorAlpha, inc, dist)), 'g')
inc = 0.13*5;
plot(vectorAlpha, normalized(returnedIntensity(vectorAlpha, inc, dist)), 'm')
inc = 0.13*4;
plot(vectorAlpha, normalized(returnedIntensity(vectorAlpha, inc, dist)), 'k')
inc = 0.13*3;
plot(vectorAlpha, normalized(returnedIntensity(vectorAlpha, inc, dist)), 'y')
inc = 0.13*2;
plot(vectorAlpha, normalized(returnedIntensity(vectorAlpha, inc, dist)), 'b')
inc = 0.13*1;
plot(vectorAlpha, normalized(returnedIntensity(vectorAlpha, inc, dist)), 'g')
inc = 0.0;
plot(vectorAlpha, normalized(returnedIntensity(vectorAlpha, inc, dist)), 'r')

% inc = 0.2618*5;
% plot(vectorAlpha, normalized(returnedIntensity(vectorAlpha, inc, dist)), 'm')
% inc = 0.2618*4;
% plot(vectorAlpha, normalized(returnedIntensity(vectorAlpha, inc, dist)), 'k')
% inc = 0.2618*3;
% plot(vectorAlpha, normalized(returnedIntensity(vectorAlpha, inc, dist)), 'y')
% inc = 0.2618*2;
% plot(vectorAlpha, normalized(returnedIntensity(vectorAlpha, inc, dist)), 'b')
% inc = 0.2618;
% plot(vectorAlpha, normalized(returnedIntensity(vectorAlpha, inc, dist)), 'g')
% inc = 0.0;
% plot(vectorAlpha, normalized(returnedIntensity(vectorAlpha, inc, dist)), 'r')
title('returned intensity', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('opening angle','Fontsize',15, 'Fontweight', 'demi');
ylabel('returned intensity', 'Fontsize', 15, 'Fontweight', 'demi');
legend(record2)
set(gca, 'Fontsize', 15);


nbInc = 50;
inc = linspace(0, 1.31, nbInc);
dhat = zeros(1,nbInc);

for i = 1:nbInc
    intensity = (returnedIntensity(vectorAlpha, inc(i), dist));
    alphaMaxInt = vectorAlpha(intensity == max(intensity));
    alphaMid = 0;
    dhat(i) = distanceFunction(alphaMid, inc(i), dist) - distanceFunction(alphaMaxInt, inc(i), dist);
    
end

figure;
plot(inc, dhat, '.-b')
title('bias between middle beam and chosen beam', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('incidence','Fontsize',15, 'Fontweight', 'demi');
ylabel('distance bias (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);


%% Histogram

% varX = centroidErr;
varX = maxErr;

figure;

% limit vector for not sampled
% limitVector = [(0:0.000075:0.0014) (0.0015:0.0005:0.003) 0.004 0.005 0.006 0.007 max(centroidErr)];

% limit vector for sampled data
limitVector = [0, 0.00025, 0.0005, 0.00075, (0.001:0.0007:0.00275), (0.00375:0.001:0.004) (0.005:0.0025:max(varX)) ];

%test if beam angle is 0.006
% limitVector = [0, 0.0025, 0.005, (0.01:0.005:0.0275), (0.0375:0.01:0.04) (0.05:0.019:max(varX)) ];

% hist
count = histc(varX, limitVector);
bar(limitVector, count, 'histc')
% set(gca, 'xlim', [limitVector(1) limitVector(end)])
%set(gca, 'YTick', (0:7500:150000));
% set(gca, 'XTick', (0:1000:max(int)));
%xticklabel_rotate(XTick,45,[],'Fontsize',15);
title('UTM indoor : distribution of distance bias', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('distance bias (m)','Fontsize',15, 'Fontweight', 'demi');
ylabel('frequency', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);



%% median graph

figure;

varY = err;

[x_hat, y_hat, w] = ponderedStats(varX, varY, limitVector);
medX = x_hat(:,1);
medErr = y_hat(:,2);
plot(medX, medErr,'.-k')
title('UTM indoor : median', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('distance bias (m)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
% xlim([0,max(int)]);
% set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);


%% angle dataset only (linear as fuck)

err = aggregateData_angles(utm_corrAngle,'utm', 'err_d');
dist = aggregateData_angles(utm_corrAngle,'utm', 'd');
int = aggregateData_angles(utm_corrAngle, 'utm', 'int');
inc = aggregateData_angles(utm_corrAngle, 'utm', 'inc');

% filters
step = 1;
int = int(int>0);
int = int(1:step:end);
err = err(int>0);
dist = dist(int>0);
err = err(1:step:end);
dist = dist(1:step:end);
inc = inc(int>0);
inc = inc(1:step:end);

% (distance chosen with max int)
beta = pi/2 - inc;
halfOpeningAngle = 0.0012217;
radiusDist = (cos(inc).*(dist + err))./cos(inc - halfOpeningAngle);
maxErr = (dist + err) - radiusDist;

% distance chosen with centroid (triangle approx.)
x = (dist + err).*sin(halfOpeningAngle)./sin(beta+halfOpeningAngle);
y = (dist + err).*sin(halfOpeningAngle)./sin(beta-halfOpeningAngle);
centroid = 2.*(x+y)./3;
xPrime = centroid - y;
chosenDist = sqrt((dist+err).^2 + xPrime.^2 -2.*(dist+err).*xPrime.*cos(beta));
centroidErr = (dist + err) - chosenDist;

% distance chosen with centroid (beer-lambert approx)
% test = exp(((dist + err) - (cos(inc).*(dist + err))./cos(inc - alpha)));


varX = maxErr;
varX = centroidErr;

figure;
scatter(varX, err, 4, inc);
hold on;
[dx, dy, dw] = statsPerBin(varX, err, 50);
% plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
% plot(dx(:,1),dy(:,3),'--k')  

title('UTM indoor angle dataset : color = incidence', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('distance bias (m)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
% set(gca, 'XTick', (0:0.05:max(varX)));
set(gca, 'Fontsize', 15);
% xlim([0, max(varX)])
% ylim([-0.15, 0.2]);

% histogram
dataA = utm_corrAngle;

figure;
limitVector = [(0:0.000075:0.0005) (0.00075:0.0005:0.003) 0.004 0.005 0.006 0.007 max(centroidErr)];
% limitVector = [min(varX) 0.98 0.985 (0.99:0.0005:max(varX))];

% hist
count = histc(varX,limitVector);
bar(limitVector, count, 'histc')
set(gca, 'xlim', [limitVector(1) limitVector(end)])
%set(gca, 'YTick', (0:7500:150000));
% set(gca, 'XTick', (0:1000:max(int)));
%xticklabel_rotate(XTick,45,[],'Fontsize',15);
title('UTM indoor : distribution of distance bias', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('distance bias (m)','Fontsize',15, 'Fontweight', 'demi');
ylabel('frequency', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);

figure;
hist(dist)
% set(gca, 'YTick', (0:50000:600000));
% set(gca, 'XTick', (0:100:max(int)));
%xticklabel_rotate(XTick,45,[],'Fontsize',15);
title('UTM indoor : distribution of distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('distance (m)','Fontsize',15, 'Fontweight', 'demi');
ylabel('frequency', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);

figure;
hist(inc)
% set(gca, 'YTick', (0:50000:600000));
% set(gca, 'XTick', (0:100:max(int)));
%xticklabel_rotate(XTick,45,[],'Fontsize',15);
title('UTM indoor : distribution of distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('distance (m)','Fontsize',15, 'Fontweight', 'demi');
ylabel('frequency', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);


figure;

[x_hat, y_hat, w] = ponderedStats(varX, err, limitVector);
medX = x_hat(:,1);
medErr = y_hat(:,2);
plot(medX, medErr,'x-r')
title('UTM indoor : median', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('distance bias (m)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
% xlim([0,max(int)]);
% set(gca, 'XTick', (0:1000:max(int)));
set(gca, 'Fontsize', 15);


%%
plate = 'steel';
sensor = 'utm';
dataSet = utm_corrAngle;

varX = 'inc';
varY = 'err_d';
path = dataSet.(sensor).indoor.(plate);

% record = {'a0', 'a15','a30','a45','a60','a75'};
color = {'.r', '.b', '.y', '.m', '.k', '.g'};
record = {'a0', 'a15','a30','a45','a60','a75'};
% record = {'d0_2','d1_0','d2_0','d4_0','d8_0'};

dmin = 2.25;
dmax = 2.3;

figure;
hold on
for i = 1:length(record)
    if(isfield(path, record{i}))
        filter = path.(record{i}).result.d > dmin & path.(record{i}).result.d < dmax;
        plot(path.(record{i}).result.(varX)(filter), path.(record{i}).result.(varY)(filter), color{i})
    end
end
 

allD = aggregateSinglePlate_angle(utm_corrAngle, 'utm', 'iron', 'd');
allErr = aggregateSinglePlate_angle(utm_corrAngle, 'utm', 'iron', 'err_d');
allInc = aggregateSinglePlate_angle(utm_corrAngle, 'utm', 'iron', 'inc');

filtre = (allD > 2.25 & allD < 2.3);
allErr = allErr(filtre);
allInc = allInc(filtre);


[dx, dy, dw] = statsPerBin(allInc, allErr, 25);
medX = dx(:,1);
medY = dy(:,2);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  


title(['UTM indoor: ', plate, ' plate'], 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('incidence (rad)','Fontsize',15, 'Fontweight', 'demi');
ylabel('err (m)', 'Fontsize', 15, 'Fontweight', 'demi');
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

% mauvais fittings qui ne prennent pas en compte distance 20 cm

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
plate = 'steel';
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


