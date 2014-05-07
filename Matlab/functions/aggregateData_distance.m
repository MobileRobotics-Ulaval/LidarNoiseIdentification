function allData = aggregateData_distance(sensor, location, x)
% Aggregates data of every plate and distance (distance dataset)

load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
plate = {'alu', 'board', 'steel', 'iron'};
%sensor = {'urg', 'utm', 'lms'};
%location = {'indoor', 'outdoor'};
%variable = {'d','err','inc','int','lat','lon','err_d'};
distance = {'d0_2', 'd1_0', 'd2_0', 'd4_0', 'd8_0'};

allData = [];
for i = 1:length(plate)
    for j  = 1:length(distance)
        if isfield(data_distance.(sensor), location) ...
                   && isfield(data_distance.(sensor).(location).(plate{i}), distance{j})

            allData = [allData ; data_distance.(sensor).(location).(plate{i}).(distance{j}).result.(x)];
        end
    end
end