
% regression indoor 50 bin :  0.012.*exp(-((x-1200)./275).^2)+0.0422*exp(-((x-2400)./1710).^2)+3.181e-06.*x-a
% regression indoor 100 bin : 0.016.*exp(-((x-1225)./273).^2)+0.042*exp(-((x-2480)./1690).^2)+3.181e-06.*x-a
% regression outdoor 50 bin :
% TODO regression outdoor 100 bin : 0.010.*exp(-((x-1110)./275).^2)+0.037*exp(-((x-2000)./1400).^2)+3.181e-06.*x-a

indoorInt = aggregateData_distance('utm','indoor','int');
indoorErr = aggregateData_distance('utm','indoor','err_d');
indoorD = aggregateData_distance('utm','indoor','d');
indoorInt = indoorInt(1:15:end);
indoorErr = indoorErr(1:15:end);
indoorD = indoorD(1:15:end);

outdoorInt = aggregateData_distance('utm','outdoor','int');
outdoorErr = aggregateData_distance('utm','outdoor','err_d');
outdoorD = aggregateData_distance('utm','outdoor','d');
outdoorInt = outdoorInt(1:15:end);
outdoorErr = outdoorErr(1:15:end);
outdoorD = outdoorD(1:15:end);

[xi, yi, wi] = statsPerBin(indoorInt, indoorErr, 50);
[xo, yo, wo] = statsPerBin(outdoorInt, outdoorErr, 50);
[xi100, yi100, wi100] = statsPerBin(indoorInt, indoorErr, 100);
[xo100, yo100, wo100] = statsPerBin(outdoorInt, outdoorErr, 100);
xiMed = xi(:,1);
yiMed = yi(:,2);
xoMed = xo(:,1);
yoMed = yo(:,2);
hold on;
scatter(indoorInt,indoorErr,4,indoorD)
plot(xi(:,1), yi(:,2), '.')
xlabel('intensity');
ylabel('error (m)');
ylim([-0.1, 0.08]);
xlim([0, 14000]);
%%
hold on;
scatter(outdoorInt,outdoorErr,4,outdoorD)
plot(xo(:,1), yo(:,2), 'r')
xlabel('intensity');
ylabel('error (m)');
ylim([-0.1, 0.05]);
xlim([-0, 14000]);
