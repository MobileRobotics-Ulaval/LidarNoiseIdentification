sensor = {'utm'};
location = {'indoor'};
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
            s = [];
            for m = 1:length(dist)
                if isfield(data.(sensor{i}).(location{j}).(plate{k}), dist{m})
                    incidence = data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.inc;
                    f = incidence < 0.01;
                    d(m) = median(data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.d(f));
                    intensity(m) = mean(data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.int(f));
                    s(m) = std(data.(sensor{i}).(location{j}).(plate{k}).(dist{m}).result.int(f));
                end
            end
            errorbar(d, intensity, s, '.', 'Color', colors{k})
        end
    end
end


% fit results
% Original: a*1.5^2*(x-0.25)*exp(-1.5*(x-0.25))+c+e*x
% Simple: a*2.25.*(x-0.25).*exp(-1.5.*(x-0.25))+e.*x+c 

u = 1;
y = 1.8;
x = 0:0.1:8;
intensity_alu =      6477*2.25.*(x-0.25).*exp(-1.5.*(x-0.25)) - 514.*x +7590;
intensity_board =  5231*2.25.*(x-0.25).*exp(-1.5.*(x-0.25)) - 245.*x+3722;
intensity_steel =   1330*2.25.*(x-0.25).*exp(-1.5.*(x-0.25)) -212.*x+2348;
intensity_iron =    1534*2.25.*(x-0.25).*exp(-1.5.*(x-0.25)) -194 .*x+2059;
plot(x, intensity_alu, '--k')
plot(x, intensity_board, '--b')
plot(x, intensity_steel, '--m')
plot(x, intensity_iron, '--r')

hold off