function allData = aggregateSinglePlate_distance(sensor, plate, location, x)
% Aggregates data of every distance for a chosen plate (distance dataset)

load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';
%sensor = {'urg', 'utm', 'lms'};
%location = {'indoor', 'outdoor'};
%variable = {'d','err','inc','int','lat','lon','err_d'};
distance = {'d0_2', 'd1_0', 'd2_0', 'd4_0', 'd8_0'};


allData = [];
for i  = 1:length(distance)
    if isfield(data_distance.(sensor), location) ...
               && isfield(data_distance.(sensor).(location).(plate), distance{i})
        allData = [allData ; data_distance.(sensor).(location).(plate).(distance{i}).result.(x)];
    end
end