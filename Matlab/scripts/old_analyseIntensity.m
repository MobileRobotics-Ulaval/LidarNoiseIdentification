load './data/data.mat';
%%
load './data/corrected_data.mat';

%%

sensor = {'utm'};
location = {'indoor'};
plate = {'alu', 'board', 'steel', 'iron'};
dist = {'d0_2', 'd1_0', 'd2_0', 'd4_0', 'd8_0'};

for i = 1:length(sensor)
    for j = 1:length(location)
        for k = 1:length(plate)
            for m = 1:length(dist)
                data = generatePoses(data, sensor{i}, location{j}, plate{k}, dist{m}, false, true, .2, false);
            end
        end
    end
end

%% Variance vs Distance

sensor = {'utm'};
location = {'indoor'};
plate = {'alu', 'board', 'steel', 'iron'};
%plate = {'iron'};
dist = {'d0_2', 'd1_0', 'd2_0', 'd4_0', 'd8_0'};
%dist = {'d1_0'};

e = [];
d = [];
intensity = [];
incidence = [];
for i = 1:length(sensor)
    for j = 1:length(location)
        for k = 1:length(plate)
            for m = 1:length(dist)
                if isfield(data.(sensor{i}).(location{j}).(plate{k}), dist{m})
                    incidence =  data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.inc;
                    f = incidence < 0.10;
                    e_f = data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.err_d(f);
                    var = e_f - median(e_f);
                    e = [e; var];
                    d_f = data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.d(f);
                    d = [d; d_f];
                    intensity = [intensity; data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.int];
                end
            end
        end
    end
end

figure
plot(d, e, 'x', 'color', [0.8 0.8 0.8])
line([0, 10], [0, 0], 'lineStyle', '--')
line([0, 10], [0.018, 0.018])
line([0, 10], [-0.018, -0.018])

set(gcf, 'position', [560   606   579   278])

ylabel('Uncertainty (m)')
xlabel('Measured depth (m)')

%% Save for thesis
saveFigArticle(gcf, '../../../../../Thesis/redaction/fig/augRobust/utmRawVariance.eps')
delete('../../../../../Thesis/redaction/fig/augRobust/utmRawVariance.pdf')

%% Intensity VS distance

sensor = {'utm'};
location = {'outdoor'};
plate = {'alu', 'board', 'steel', 'iron'};
dist = {'d0_2', 'd1_0', 'd2_0', 'd4_0', 'd8_0'};
colors = {'k', 'b', 'm', 'r', 'g'};
figure
hold on
for i = 1:length(sensor)
    for j = 1:length(location)
        for k = 1:length(plate)
            d = [];
            intensity = [];
            for m = 1:length(dist)
                incidence = data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.inc;
                f = incidence <0.05;
                d(m) = mean(data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.d(f));
                intensity(m) = mean(data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.int(f));
                
            end
            plot(d, intensity, '.-', 'Color', colors{k})
        end
    end
end
hold off


%%
location = 'outdoor';

err_d0_2 = [%data.utm.(location).alu.d0_2.result.err_d; 
                   data.utm.(location).board.d0_2.result.err_d; 
                   data.utm.(location).steel.d0_2.result.err_d;
                   data.utm.(location).iron.d0_2.result.err_d];
 
int_d0_2 = [data.utm.(location).alu.d0_2.result.int; 
                   data.utm.(location).board.d0_2.result.int; 
                   data.utm.(location).steel.d0_2.result.int;
                   data.utm.(location).iron.d0_2.result.int];
               
err_d1_0 = [data.utm.(location).alu.d1_0.result.err_d; 
                   data.utm.(location).board.d1_0.result.err_d; 
                   data.utm.(location).steel.d1_0.result.err_d;
                   data.utm.(location).iron.d1_0.result.err_d];

int_d1_0 = [data.utm.(location).alu.d1_0.result.int; 
                   data.utm.(location).board.d1_0.result.int; 
                   data.utm.(location).steel.d1_0.result.int;
                   data.utm.(location).iron.d1_0.result.int];
               
err_d2_0 = [data.utm.(location).alu.d2_0.result.err_d; 
                   data.utm.(location).board.d2_0.result.err_d; 
                   data.utm.(location).steel.d2_0.result.err_d;
                   data.utm.(location).iron.d2_0.result.err_d];
               
int_d2_0 = [data.utm.(location).alu.d2_0.result.int; 
                   data.utm.(location).board.d2_0.result.int; 
                   data.utm.(location).steel.d2_0.result.int;
                   data.utm.(location).iron.d2_0.result.int];

err_d4_0 = [data.utm.(location).alu.d4_0.result.err_d; 
                   data.utm.(location).board.d4_0.result.err_d; 
                   data.utm.(location).steel.d4_0.result.err_d;
                   data.utm.(location).iron.d4_0.result.err_d];               

int_d4_0 = [data.utm.(location).alu.d4_0.result.int; 
                   data.utm.(location).board.d4_0.result.int; 
                   data.utm.(location).steel.d4_0.result.int;
                   data.utm.(location).iron.d4_0.result.int]; 
               
err_d8_0 = [data.utm.(location).alu.d8_0.result.err_d; 
                   data.utm.(location).board.d8_0.result.err_d; 
                   data.utm.(location).steel.d8_0.result.err_d;
                   data.utm.(location).iron.d8_0.result.err_d];              
               
int_d8_0 = [data.utm.(location).alu.d8_0.result.int; 
                   data.utm.(location).board.d8_0.result.int; 
                   data.utm.(location).steel.d8_0.result.int;
                   data.utm.(location).iron.d8_0.result.int];          
               
err_all = [err_d0_2; err_d1_0; err_d2_0; err_d4_0; err_d8_0];
int_all = [int_d0_2; int_d1_0; int_d2_0; int_d4_0; int_d8_0];
               
%%
location = 'outdoor';

figure
subplot(5,1,1)
hold on
dist = 'd0_2';
plot(data.utm.(location).alu.(dist).result.int,  data.utm.(location).alu.(dist).result.err_d, '.k')
plot(data.utm.(location).board.(dist).result.int, data.utm.(location).board.(dist).result.err_d, '.b')
plot(data.utm.(location).iron.(dist).result.int, data.utm.(location).iron.(dist).result.err_d, '.r')
plot(data.utm.(location).steel.(dist).result.int, data.utm.(location).steel.(dist).result.err_d, '.m')
xlim([0, 6000])
ylim([-0.04, 0.04])

subplot(5,1,2)
hold on
dist = 'd1_0';
plot(data.utm.(location).alu.(dist).result.int,  data.utm.(location).alu.(dist).result.err_d, '.k')
plot(data.utm.(location).board.(dist).result.int, data.utm.(location).board.(dist).result.err_d, '.b')
plot(data.utm.(location).iron.(dist).result.int, data.utm.(location).iron.(dist).result.err_d, '.r')
plot(data.utm.(location).steel.(dist).result.int, data.utm.(location).steel.(dist).result.err_d, '.m')
xlim([0, 6000])
ylim([-0.04, 0.04])

subplot(5,1,3)
hold on
dist = 'd2_0';
plot(data.utm.(location).alu.(dist).result.int,  data.utm.(location).alu.(dist).result.err_d, '.k')
plot(data.utm.(location).board.(dist).result.int, data.utm.(location).board.(dist).result.err_d, '.b')
plot(data.utm.(location).iron.(dist).result.int, data.utm.(location).iron.(dist).result.err_d, '.r')
plot(data.utm.(location).steel.(dist).result.int, data.utm.(location).steel.(dist).result.err_d, '.m')
xlim([0, 6000])
ylim([-0.04, 0.04])

subplot(5,1,4)
hold on
dist = 'd4_0';
plot(data.utm.(location).alu.(dist).result.int,  data.utm.(location).alu.(dist).result.err_d, '.k')
plot(data.utm.(location).board.(dist).result.int, data.utm.(location).board.(dist).result.err_d, '.b')
plot(data.utm.(location).iron.(dist).result.int, data.utm.(location).iron.(dist).result.err_d, '.r')
plot(data.utm.(location).steel.(dist).result.int, data.utm.(location).steel.(dist).result.err_d, '.m')
xlim([0, 6000])
ylim([-0.04, 0.04])

subplot(5,1,5)
hold on
dist = 'd8_0';
plot(data.utm.(location).alu.(dist).result.int,  data.utm.(location).alu.(dist).result.err_d, '.k')
plot(data.utm.(location).board.(dist).result.int, data.utm.(location).board.(dist).result.err_d, '.b')
plot(data.utm.(location).iron.(dist).result.int, data.utm.(location).iron.(dist).result.err_d, '.r')
plot(data.utm.(location).steel.(dist).result.int, data.utm.(location).steel.(dist).result.err_d, '.m')
xlim([0, 6000])
ylim([-0.04, 0.04])
xlabel('Intensity')
ylabel('Error')

%%
% Correction based on intensity (poly4)
% R-square: 0.9351
% 

% if i > 500 && i < 3800
%     corr = -1.816e-15*i^4 + 9.57e-12*i^3 - 2.942e-08*i^2 + 8.685e-05*i - 0.07755;
%     depth = depth + corr;
% end



