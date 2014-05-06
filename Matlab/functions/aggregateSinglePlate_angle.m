function allData = aggregateSinglePlate_angle(sensor, plate, x)

load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';
%sensor = {'utm', 'lms'};
%variable = {'d','err','inc','int','lat','lon','err_d'};
angle = {'a0', 'a15', 'a30', 'a45', 'a60', 'a75'};


allData = [];
for i  = 1:length(angle)
    if isfield(data_angle.(sensor).indoor.(plate), angle{i})
        allData = [allData ; data_angle.(sensor).indoor.(plate).(angle{i}).result.(x)];
    end
end