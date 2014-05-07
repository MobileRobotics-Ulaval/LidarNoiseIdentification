% scatter all datasets (angle and distance)

dInt = aggregateData_distance('utm','indoor','int');
dErr = aggregateData_distance('utm','indoor','err_d');
dDist = aggregateData_distance('utm','indoor','d');
aInt = aggregateData_angles('utm','int');
aErr = aggregateData_angles('utm','err_d');
aDist = aggregateData_angles('utm','d');

% aggregation
int = [dInt ; aInt];
err = [dErr ; aErr];
dist = [dDist ; aDist];

% filters
step = 20;
int = int(int>0);
err = err(int>0);
dist = dist(int>0);
int = int(1:step:end);
err = err(1:step:end);
dist = dist(1:step:end);

scatter(int, err, 4, dist);

title('UTM indoor : color = distance', 'Fontsize', 15, 'Fontweight', 'demi')
xlabel('intensity','Fontsize',15, 'Fontweight', 'demi');
ylabel('error (m)', 'Fontsize', 15, 'Fontweight', 'demi');
ylim([-0.15, 0.2]);
%xlim([0, 14000]);
