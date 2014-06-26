lms = importdata('./data/lms100Beam.txt');

lms.w = ((lms.data(:,2) - lms.data(:,1))./2)./100;
lms.d = lms.data(:,3);

% cftool:
% Linear model Poly1:
%        f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
lms.p1 =    0.006793; %  (0.006033, 0.007553)
lms.p2 =   0.0008071; %  (-0.003287, 0.004901)
%-----------------------------
% General model:
%        f(x) = a*x
% Coefficients (with 95% confidence bounds):
%        a =    0.006918  (0.006624, 0.007212)

lms.a_rad = mean(atan2(lms.w, lms.d).*2);
lms.a_deg = lms.a_rad*180/pi

%----------------------------------
utm = importdata('./data/utm30lxBeam.txt');

utm.w = ((utm.data(:,2) - utm.data(:,1))./2)./100;
utm.d = utm.data(:,3);

% cftool:
% Linear model Poly1:
%        f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
utm.p1 =   0.0005929; %  (0.0004259, 0.0007599)
utm.p2 =     0.00148; %  (0.0003821, 0.002577)
%-----------------------------
% General model:
%        f(x) = a*x
% Coefficients (with 95% confidence bounds):
%        a =   0.0007847  (0.0006083, 0.0009612)
       
utm.a_rad = mean(atan2(utm.w, utm.d).*2);
utm.a_deg = utm.a_rad*180/pi

%----------------------------------
urg = importdata('./data/urg04lxBeam.txt');

urg.w = ((urg.data(:,2) - urg.data(:,1))./2)./100;
urg.d = urg.data(:,3);

% cftool:
% urg.w = ((urg.data(:,2) - urg.data(:,1))./2)./100;
% urg.d = urg.data(:,3);
% 
% Linear model Poly1:
%        f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
urg.p1 =      0.0013; %  (0.0007488, 0.001851)
urg.p2 =     -0.0001; %  (-0.001928, 0.001728)
%-----------------------------
% General model:
%        f(x) = a*x
% Coefficients (with 95% confidence bounds):
%        a =    0.001273  (0.001094, 0.001451)

urg.a_rad = mean(atan2(urg.w, urg.d).*2);
urg.a_deg = urg.a_rad*180/pi

%% Figure for article
c = fireprint(4);
c = c(1:end-1,:);

x = [0:0.1:10];
h = figure;
hold on
plot(urg.d, urg.w, '.', 'Color', c(1,:), 'MarkerSize', 15)
plot(utm.d, utm.w, 's', 'Color', c(2,:))
plot(lms.d, lms.w, 'x', 'Color', c(3,:))


plot(x, lms.p1*x + lms.p2, '--', 'Color', c(3,:))
plot(x, utm.p1*x + utm.p2, '--', 'Color', c(2,:))
plot(x, urg.p1*x + urg.p2, '--', 'Color', c(1,:))

ylim([-0.001, 0.07]);

set(gcf, 'Position', [560   608   577   276]);
xlabel('Distance (m)')
ylabel('Beam radius (m)')


%% Save figure
h2 = saveFigArticle(h, []);
legend('URG-04LX', 'UTM-30LX', 'LMS-151', 'Location', 'NW')
saveFigArticle(h2, '../article/figures/beamRadius', 'copyFigure', false);
delete('../article/figures/beamRadius.pdf')
