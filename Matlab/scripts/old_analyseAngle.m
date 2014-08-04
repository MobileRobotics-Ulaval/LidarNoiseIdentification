%%

sensor = {'utm'};
location = {'indoor'};
plate = {'alu', 'board', 'steel', 'iron'};
plate = {'alu'};
colors = {'k', 'b', 'm', 'r', 'g'};
dist = {'d0_2', 'd1_0', 'd2_0', 'd4_0', 'd8_0'};
%dist = {'d4_0'};

figure
hold on
for i = 1:length(sensor)
    for j = 1:length(location)
        for k = 1:length(plate)
            for m = 1:length(dist)
                x = (data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.lon);
                y = (data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.lat);
                z = (data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.int);
                plot3(x, y, z, '.', 'Color', colors{m})
                zlim([0, 4000])
                title(plate{k})
            end
        end
    end
end
hold off