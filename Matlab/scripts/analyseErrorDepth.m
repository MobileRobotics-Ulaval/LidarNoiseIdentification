load './data/data.mat';

%%
plate = {'alu', 'board', 'steel', 'iron'};
dist = {'d0_2', 'd1_0', 'd2_0', 'd4_0', 'd8_0'};


for k = 1:length(plate)
    urg_e = [];
    utm_e = [];
    lms_e = [];
    for m = 1:length(dist)
        if isfield(data.urg.indoor.(plate{k}), dist{m})
            e = data.urg.indoor.(plate{k}).(dist{m}).result.err_d;
            urg_e = [urg_e; e];
            e = data.utm.indoor.(plate{k}).(dist{m}).result.err_d;
            f = abs(e) < 0.05;
            utm_e = [utm_e; e(f)];
            e = data.lms.outdoor.(plate{k}).(dist{m}).result.err_d;
            f = abs(e) < 0.05;
            lms_e = [lms_e; e(f)];
        end
    end
    r.urg.(plate{k}).e = quantile(urg_e, [0.16, 0.5, 0.84]);
    r.utm.(plate{k}).e = quantile(utm_e, [0.16, 0.5, 0.84]);
    r.lms.(plate{k}).e = quantile(lms_e, [0.16, 0.5, 0.84]);
end


%% Figure for article
sensor = {'urg', 'utm', 'lms'};
plate = {'alu', 'board', 'steel', 'iron'};
c = fireprint(4);
c = c(1:end-1,:);

h = figure;

hold on
id = 1;
for i = 1:length(sensor)
    for k = 1:length(plate)
        h_e = errorbar(id, r.(sensor{i}).(plate{k}).e(2), r.(sensor{i}).(plate{k}).e(1), r.(sensor{i}).(plate{k}).e(3), ...
            '.', 'Color', c(i,:), 'LineWidth', 1.5, 'MarkerSize', 15);
        id = id+1;
    end
end
set(gca,'XTick',[1:12])
set(gca,'XTickLabel','A|B|S|I')
xlim([0,13])
ylim([-0.05 0.185])
errorbar_tick(h, 20)
text(2.5, 0.18, 'URG-04LX', 'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Middle')
text(6.5, 0.18, 'UTM-30LX', 'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Middle')
text(10.5, 0.18, 'LMS-151', 'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Middle')
ylabel('Error on depth (m)');
grid on
set(gcf, 'Position', [560   661   649   223]);
%% Save figure
saveFigArticle(h, '../article/figures/errorDepth');
delete('../article/figures/errorDepth.pdf')

%% Deviation over distances

sensor = {'utm'};
location = {'outdoor'};
plate = {'alu', 'board', 'steel', 'iron'};
%plate = {'board'};
dist = {'d0_2', 'd1_0', 'd2_0', 'd4_0', 'd8_0'};
colors = {'k', 'b', 'm', 'r', 'g'};


all_intensity = [];
all_d = [];
all_error = [];
d_med = zeros(5,1);
e_qua = zeros(5,1);
for i = 1:length(sensor)
    for j = 1:length(location)
        for m = 1:length(dist)
            d = [];
            intensity = [];
            incidence =[];
            error = [];
            d = [];
            for k = 1:length(plate)
                if isfield(data.(sensor{i}).(location{j}).(plate{k}), dist{m})
                    incidence = data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.inc;
                    f = incidence < 1.5;
                    %f = incidence < 0.2;
                    %f = incidence > 0.5 & incidence < 1.0;
                    %f = incidence > 1.0;
                    d = [d; data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.d(f)];
                    error = [error; data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.err_d(f)];
                    
                    
                    all_d = [all_d; d];
                    all_error = [all_error; error]; 
                end
            end
            d_med(m) = median(d);
            e_qua(m) = (quantile(error, 0.833) - quantile(error, 0.166))/2;
            
        end
    end
end



%%
[x_hat, y_hat, w] = statsPerBin(all_d, all_error, 100);

all_q = quantile(all_error, [0.166, 0.5, 0.833]);

x = x_hat(:,2);
radius = (y_hat(:,3)-y_hat(:,1))./2;
const_radius = ones(size(x_hat)).*(all_q(3)-all_q(1))/2;

c = fireprint(3, 'maxColor', [0.6 0.6 1]);
if sensor{:} == 'urg'
    c = c(1,:);
else if sensor{:} == 'utm'
        c = c(2,:);
    else
        c = c(3,:);
    end
end

f = 1./sqrt(w) < 0.15;
%figure
subplot(3,1,1)
hold on
plot(x_hat(:,2), y_hat(:,2), 'Color', c(1,:))
plot(x_hat(:,1), ones(size(x_hat(:,1))).*all_q(2),  '--', 'Color', c(1,:))

subplot(3,1,2)
hold on
plot(x_hat(f,1), radius(f),  '--', 'Color', c(1,:))
plot(x_hat(f,1), const_radius(f),  '--', 'Color', c(1,:))
plot(d_med, e_qua, 'x', 'Color', c(1,:))

subplot(3,1,3)
hold on
plot(x_hat(:,1), 1./sqrt(w),  'Color', c(1,:))
%bar(x_hat(:,2), w)
mean(e_qua)

%% Plot final uncertainty model

x = [0:0.02:52];

urg_const_radius         = 0.028.*ones(size(x));
utm_const_radius_in   = 0.012.*ones(size(x));
utm_const_radius_out = 0.018.*ones(size(x));
lms_const_radius         = 0.012.*ones(size(x));

urg_beam =  0.0013.*x - 0.0001;
utm_beam = 0.0006.*x + 0.00148;
lms_beam = 0.0068.*x + 0.00081;
kinect_beam = 0.5*(2.85e-3).*x.^2;

c = fireprint(4);
c = c(1:end-1,:);


h = figure;
hold on

% URG
minRange = 0.02;
maxRange = 4.0;
range = (x<= maxRange) & (x>= minRange);
radius = max(urg_const_radius, urg_beam);
plot([minRange, x(range), maxRange], [0, radius(range), 0], 'Color', c(1,:), 'LineWidth', 1.5)

% UTM
minRange = 0.1;
maxRange = 30.0;
range = (x<= maxRange) & (x>= minRange);
radius = max(utm_const_radius_out, utm_beam);
plot([minRange, x(range), maxRange], [0, radius(range), 0], 'Color', c(2,:))

% LMS
minRange = 0.5;
maxRange = 50.0;
range = (x<= maxRange) & (x>= minRange);
radius = max(lms_const_radius, lms_beam);
plot([minRange, x(range), maxRange], [0, radius(range), 0], 'Color', c(3,:))

% Kinect
minRange = 0.7;
maxRange = 6.0;
range = (x<= maxRange) & (x>= minRange);
plot([minRange, x(range), maxRange], [0, kinect_beam(range), 0], '--', 'Color', c(2,:), 'LineWidth', 1.5)


% URG
minRange = 0.02;
maxRange = 4.0;
range = (x<= maxRange) & (x>= minRange);
radius = max(urg_const_radius, urg_beam);
plot([minRange, x(range), maxRange], -[0, radius(range), 0], 'Color', c(1,:), 'LineWidth', 1.5)

% UTM
minRange = 0.1;
maxRange = 30.0;
range = (x<= maxRange) & (x>= minRange);
radius = max(utm_const_radius_out, utm_beam);
plot([minRange, x(range), maxRange], -[0, radius(range), 0], 'Color', c(2,:))

% LMS
minRange = 0.5;
maxRange = 50.0;
range = (x<= maxRange) & (x>= minRange);
radius = max(lms_const_radius, lms_beam);
plot([minRange, x(range), maxRange], -[0, radius(range), 0], 'Color', c(3,:))

% Kinect
minRange = 0.7;
maxRange = 6.0;
range = (x<= maxRange) & (x>= minRange);
plot([minRange, x(range), maxRange], -[0, kinect_beam(range), 0], '--', 'Color', c(2,:), 'LineWidth', 1.5)

xlim([0, 52])
ylim([-0.35, 0.35])
xlabel('Measured depth (m)')
ylabel('Uncertainty (m)')
set(gca, 'yTick', [-.3:0.1:0.3])
set(gcf, 'Position', [930   581   556   200]);
h_a = gca;
%legend('URG-04LX', 'UTM-30LX', 'LMS-151', 'Kinect', 'Location','NorthEastOutside', 'Orientation', 'horizontal')
%saveFigArticle(gcf, '../article/figures/legendErrorRadius');
%delete('../article/figures/legendErrorRadius.pdf')

%% Save figure (large)
saveFigArticle(h, '../article/figures/errorRadius');
delete('../article/figures/errorRadius.pdf')

%% Save figure (zoom)
legend(h_a, 'hide')
xlim(h_a, [0, 7])
ylim(h_a, [-0.06, 0.06])
set(h_a, 'yTick', [-0.06: 0.02: 0.06])
saveFigArticle(h, '../article/figures/errorRadius_zoom');
delete('../article/figures/errorRadius_zoom.pdf')

