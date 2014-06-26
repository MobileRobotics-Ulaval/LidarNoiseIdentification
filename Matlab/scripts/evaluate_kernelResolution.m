sensor = {'utm'};
location = {'outdoor'};
plate = {'alu', 'board', 'steel', 'iron'};

dist = {'d0_2', 'd1_0', 'd2_0', 'd4_0', 'd8_0'};
colors = {'k', 'b', 'm', 'r', 'g'};
correction = false;
kernelSize = [0.001, 0.01, 0.05, 0.1, 0.2, 0.5];

for i = 1:length(sensor)
    for j = 1:length(location)
        for k = 1:length(plate)
            for m = 1:length(dist)
                if isfield(data.(sensor{i}).(location{j}).(plate{k}), dist{m})
                    for n = 1:length(kernelSize)
                        data = generatePoses(data, sensor{i}, location{j}, plate{k}, dist{m}, false, correction, kernelSize(n), true);
                        f = abs(data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.err_d) < 0.05;
                        kernelTests(n).(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.err_n = data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.err_n(f);
                        fprintf('kernel size: %f, %s, %s, %s, %s\n', kernelSize(n), sensor{i}, location{j}, plate{k}, dist{m});
                    end
                end
            end
        end
    end
end


%% Plot UTM

kernelSize = [0.001, 0.01, 0.05, 0.1, 0.2, 0.5];
plate = {'alu', 'board', 'steel', 'iron'};
%dist = {'d0_2', 'd1_0', 'd2_0', 'd4_0', 'd8_0'};
dist = {'d1_0', 'd2_0', 'd4_0', 'd8_0'};
sensor = 'lms';
location = 'outdoor';

load(['./data/kernel_', sensor, '_', location, '.mat']);

alu = zeros(3, length(kernelSize));
board = zeros(3, length(kernelSize));
steel = zeros(3, length(kernelSize));
iron = zeros(3, length(kernelSize));
all_plates = zeros(3, length(kernelSize));

for n = 1:length(kernelSize)
    alu_all = [];
    board_all = [];
    steel_all = [];
    iron_all = [];
    for m = 1:length(dist)
        if isfield(kernelTests(n).(sensor).(location).alu, dist{m})
            alu_all = [alu_all; kernelTests(n).(sensor).(location).alu.(dist{m}).result.err_n];
            board_all = [board_all; kernelTests(n).(sensor).(location).board.(dist{m}).result.err_n];
            steel_all = [steel_all; kernelTests(n).(sensor).(location).steel.(dist{m}).result.err_n];
            iron_all = [iron_all; kernelTests(n).(sensor).(location).iron.(dist{m}).result.err_n];
        end
    end
    alu(:,n) = quantile(alu_all, [0.25, 0.5, 0.75]);
    board(:,n) = quantile(board_all, [0.25, 0.5, 0.75]);
    steel(:,n) = quantile(steel_all, [0.25, 0.5, 0.75]);
    iron(:,n) = quantile(iron_all, [0.25, 0.5, 0.75]);
    all_plates(:,n) = quantile([alu_all; board_all; steel_all; iron_all], [0.25, 0.5, 0.75]);
end

%%
c = fireprint(6);
c = c(1:end-1,:);

% figure
% hold on
% errorbar(kernelSize, alu(2,:), alu(2,:)-alu(1,:), alu(3,:)-alu(2,:), '.-', 'Color', c(1,:))
% errorbar(kernelSize, board(2,:), board(2,:)-board(1,:), board(3,:)-board(2,:), '.-', 'Color', c(2,:))
% errorbar(kernelSize, steel(2,:), steel(2,:)-steel(1,:), steel(3,:)-steel(2,:), '.-', 'Color', c(3,:))
% errorbar(kernelSize, iron(2,:), iron(2,:)-iron(1,:), iron(3,:)-iron(2,:), '.-', 'Color', c(4,:))
% errorbar(kernelSize, all_plates(2,:), all_plates(2,:)-all_plates(1,:), all_plates(3,:)-all_plates(2,:), '.-', 'Color', c(5,:))

figure
hold on
plot(kernelSize(2:end), alu(2,2:end), '.-', 'Color', c(1,:))
plot(kernelSize(2:end), board(2,2:end), '.-', 'Color', c(2,:))
plot(kernelSize(2:end), steel(2,2:end), '.-', 'Color', c(3,:))
plot(kernelSize(2:end), iron(2,2:end), '.-', 'Color', c(4,:))
plot(kernelSize(2:end), all_plates(2,2:end), '.--g')
xlabel('Kernel Size (m)')
ylabel('Surface normal error (rad)')
legend('Aluminum', 'White Board', 'Steel', 'Iron')


%% Article figure

load('./data/kernelSizeAll.mat');
kernelSize = [0.01, 0.05, 0.1, 0.2, 0.5];

c = fireprint(4);
c = c(1:end-1,:);

h = figure;
hold on
plot(kernelSize, kernelSizeAll(1,:), '.-', 'Color', c(1,:), 'MarkerSize', 15); % URG
plot(kernelSize, kernelSizeAll(2,:), 's-', 'Color', c(2,:)); % UTM
plot(kernelSize, kernelSizeAll(3,:), 'x-', 'Color', c(3,:)); % LMS
ylim([0, 0.15])
set(gca, 'yTick', [0: 0.05: 0.15])
xlabel('Radius of nearest neighbor (m)')
ylabel('Surface normal error (rad)')
set(gcf, 'Position', [560   608   577   207]);

%% Save figure
h2 = saveFigArticle(h, []);
legend('URG-04LX', 'UTM-30LX', 'LMS-151', 'Location', 'NE')
saveFigArticle(h2, '../article/figures/kernelSize.eps', 'copyFigure', false);
delete('../article/figures/kernelSize.pdf')