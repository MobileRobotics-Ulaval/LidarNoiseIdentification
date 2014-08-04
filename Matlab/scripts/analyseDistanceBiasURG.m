%% URG distance vs error prediction (test)

dataD = data_distance;
dataA = data_angle; 

int = aggregateData_distance(data_distance,'urg', 'indoor', 'int');
err = aggregateData_distance(data_distance,'urg', 'indoor', 'err_d');
dist = aggregateData_distance(data_distance,'urg', 'indoor', 'd');
inc = aggregateData_distance(data_distance,'urg', 'indoor', 'inc');

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

% (distance chosen with max int)
beta = pi/2 - inc;

%good one
halfOpeningAngle = 0.0011345;

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

varX = maxErr;

figure;
scatter(varX, err, 4, inc);
hold on;
[dx, dy, dw] = statsPerBin(varX, err, 25);
% plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
% plot(dx(:,1),dy(:,3),'--k')  

title('URG indoor data: color = incidence', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('distance bias (m)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
% set(gca, 'XTick', (0:0.05:max(varX)));
set(gca, 'Fontsize', 15);
% xlim([0, max(varX)])
% ylim([-0.15, 0.2]);
