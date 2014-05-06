%variable = {'d','err','inc','int','lat','lon','err_d'};

% Distance indoor
figure;
step = 18;
dInt = aggregateData_distance('utm','indoor','int');
dErr = aggregateData_distance('utm','indoor','err_d');
dDist = aggregateData_distance('utm','indoor','d');

dInt = dInt(1:step:end);
dErr = dErr(1:step:end);
dDist = dDist(1:step:end);

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);

scatter(dInt, dErr, 4, dDist);
hold on;
[dx, dy, dw] = statsPerBin(dInt, dErr, 100);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('Indoor : color = distance')
xlabel('intensity');
ylabel('error (m)');
ylim([-0.1, 0.1]);
%xlim([0, 14000]);


%% Distance outdoor
figure;
step = 18;
dInt = aggregateData_distance('utm','outdoor','int');
dErr = aggregateData_distance('utm','outdoor','err_d');
dDist = aggregateData_distance('utm','outdoor','d');

dInt = dInt(1:step:end);
dErr = dErr(1:step:end);
dDist = dDist(1:step:end);

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);

hold on;
scatter(dInt, dErr, 4, dDist);
[dx, dy, dw] = statsPerBin(dInt, dErr, 100);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('Outdoor : color = distance')
xlabel('intensity');
ylabel('error (m)');
ylim([-0.1, 0.1]);
%xlim([0, 14000]);



%%
%Angles
figure;
step = 10;

aInt = aggregateData_angles('utm','int');
aErr = aggregateData_angles('utm','err_d');
%aDist = aggregateData_angles('utm','d');
aInc = aggregateData_angles('utm','inc');

aInt = aInt(1:step:end);
aErr = aErr(1:step:end);
%aDist = aDist(1:step:end);
aInc = aInc(1:step:end);


hold on;
scatter(aInt(aInt>0), aErr(aInt>0), 4, aInc(aInt>0));
[ax, ay, aw] = statsPerBin(aInt(aInt>0), aErr(aInt>0), 50);
plot(ax(:,1),ay(:,1),'--k')
plot(ax(:,1),ay(:,2),'.k')
plot(ax(:,1),ay(:,3),'--k') 

title('Indoor : color = incidence')
xlabel('intensity');
ylabel('error (m)');
ylim([-0.1, 0.2]);
%xlim([0, 14000]);

