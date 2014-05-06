%sensor = {'urg', 'utm', 'urg'};
%location = {'indoor', 'indoor'};
%variable = {'d','err','inc','int','lat','lon','err_d'};

% indoor pas dans le data_distance avec urg ?


% Distance
figure;
step = 15;
dInt = aggregateData_distance('urg','indoor','int');
dErr = aggregateData_distance('urg','indoor','err_d');
dDist = aggregateData_distance('urg','indoor','d');
%dInc = aggregateData_distance('urg','indoor','inc');

dInt = dInt(1:step:end);
dErr = dErr(1:step:end);
dDist = dDist(1:step:end);
%dInc = dInc(1:step:end);

dInt = dInt(dInt>0);
dErr = dErr(dInt>0);
dDist = dDist(dInt>0);
%dInc = dInc(dInt>0);
hold on;

scatter(dInt, dErr, 4, dDist);
[dx, dy, dw] = statsPerBin(dInt, dErr, 50);
plot(dx(:,1),dy(:,1),'--k')
plot(dx(:,1),dy(:,2),'.k')
plot(dx(:,1),dy(:,3),'--k')  

title('Indoor : color = distance')
xlabel('intensity');
ylabel('error (m)');
ylim([-0.1, 0.15]);
xlim([0, 7500]);

