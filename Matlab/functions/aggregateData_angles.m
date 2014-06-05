function allData = aggregateData_angles(data, sensor, x)
% Aggregates data of every plate and angle (angle dataset)
% load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';

plate = {'alu', 'board', 'steel', 'iron'};
angle = {'a0', 'a15', 'a30', 'a45', 'a60', 'a75'};

allData = [];
for i = 1:length(plate)
    for j  = 1:length(angle)
        if isfield(data.(sensor).indoor.(plate{i}), angle{i})
            allData = [allData ; data.(sensor).indoor.(plate{i}).(angle{j}).result.(x)];
        end
    end
end