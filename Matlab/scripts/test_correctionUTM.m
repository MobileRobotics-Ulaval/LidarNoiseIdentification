clear;
clc;

load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';

sensor = {'utm'};
location = {'indoor','outdoor'};
plate = {'board', 'alu', 'steel', 'iron'};
dist = {'d0_2', 'd1_0', 'd2_0', 'd4_0', 'd8_0'};

for i = 1:length(sensor)
    for j = 1:length(location)
        for k = 1:length(plate)
            for m = 1:length(dist)
                if isfield(data_distance.(sensor{i}), location{j}) ...
                   && isfield(data_distance.(sensor{i}).(location{j}).(plate{k}), dist{m})
               
                   [x_hat, y_hat, z_hat, int] = correctScan(data_distance, sensor{i}, location{j}, plate{k}, dist{m}, 1);
                   
                end
            end
        end
    end
end