function allData = aggregateData_angles(sensor, x)
% Aggregates data of every plate and angle (angle dataset)
% load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';

%sensor = {'utm', 'lms'};
%location = {'indoor'};
%variable = {'d','err','inc','int','lat','lon','err_d'};
plate = {'alu', 'board', 'steel', 'iron'};
angle = {'a0', 'a15', 'a30', 'a45', 'a60', 'a75'};

allData = [];
for i = 1:length(plate)
    for j  = 1:length(angle)
        if isfield(data_angle.(sensor).indoor.(plate{i}), angle{i})
            allData = [allData ; data_angle.(sensor).indoor.(plate{i}).(angle{j}).result.(x)];
        end
    end
end