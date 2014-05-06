sensor = {'utm'};
location = {'indoor'};
plate = {'board'};
dist = {'d0_2', 'd1_0', 'd2_0', 'd4_0', 'd8_0'};
colors = {'k', 'b', 'm', 'r', 'g'};

figure
hold on
for i = 1:length(sensor)
    for j = 1:length(location)
        for k = 1:length(plate)
            d = [];
            intensity = [];
            incidence =[];
            for m = 1:length(dist)
                d = data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.d;
                %f = d > 0.1 & d< 0.45;
                f = d > 0.9 & d< 1.1;
                %f = d > 1.8 & d< 2.2;
                %f = d > 3.5 & d< 4.5;
                %f = d > 7 & d< 8;
                incidence = [incidence; data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.inc(f)];
                intensity = [intensity; data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.int(f)];
            end
            intensity = smooth(incidence, intensity, 0.2);
            plot(incidence, intensity, '.', 'Color', colors{k})
            xlim([0, 1.4])
        end
    end
end
hold off

%%
% fit results
% board: f(x) = b/(pi*0.018*(1+((x/0.018))^2))-800*x+d
x = 0:0.01:1.4;
board_1m = 477./(pi*0.018*(1+((x./0.018)).^2))-800*x+4164;
board_2m = 168./(pi*0.018*(1+((x./0.018)).^2))-800*x+3060;
board_4m = 180./(pi*0.018*(1+((x./0.018)).^2))-800*x+2178;
board_8m = 183./(pi*0.018*(1+((x./0.018)).^2))-800*x+1011;
figure
hold on
plot(x, board_1m, 'b--')
plot(x, board_2m, 'b--')
plot(x, board_4m, 'b--')
plot(x, board_8m, 'b--')
