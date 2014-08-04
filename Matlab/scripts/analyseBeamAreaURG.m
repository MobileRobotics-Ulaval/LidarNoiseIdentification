clear;
clc;
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';


%% URG beam area (test)

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

% (distance chosen with max int)
beta = pi/2 - inc;

%good one
halfOpeningAngle = 0.0011345;

x = (dist).*sin(halfOpeningAngle)./sin(beta+halfOpeningAngle);
y = (dist).*sin(halfOpeningAngle)./sin(beta-halfOpeningAngle);
area = pi.*(x./2).*(y./2);

step = 1;
area = area(1:step:end);

figure;
scatter(area, err, 4, dist);
hold on;
[dx, dy, dw] = statsPerBin(area, err, 25);
plot(dx(:,2), dy(:,2), '.k')

title('URG indoor (intensity NOT corrected): all plates, color = distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('beam area (m²)','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
set(gca, 'Fontsize', 15);
