function allData = aggregateSinglePlate_angle(data, sensor, plate, x)
% Aggregates data of every angle for a chosen plate (angle dataset)

% load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';

%sensor = {'utm', 'lms'};
%variable = {'d','err','inc','int','lat','lon','err_d'};
angle = {'a0', 'a15', 'a30', 'a45', 'a60', 'a75'};


allData = [];
for i  = 1:length(angle)
    if isfield(data.(sensor).indoor.(plate), angle{i})
        allData = [allData ; data.(sensor).indoor.(plate).(angle{i}).result.(x)];
    end
end