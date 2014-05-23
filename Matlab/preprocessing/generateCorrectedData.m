%% Generate corrected data from distance dataset

% ****************** generateIDs_distance before ***********************

% sensor = {'urg','utm','lms'};
% location = {'indoor','outdoor'};
% plate = {'board', 'alu', 'steel', 'iron'};
sensor = {'utm'};
location = {'indoor'};
plate = {'board', 'alu', 'steel', 'iron'};
dist = {'d0_2', 'd1_0', 'd2_0', 'd4_0', 'd8_0'};

for i = 1:length(sensor)
    for j = 1:length(location)
        for k = 1:length(plate)
            for m = 1:length(dist)
                if isfield(data.(sensor{i}), location{j}) ...
                   && isfield(data.(sensor{i}).(location{j}).(plate{k}), dist{m})
               
                   data = generatePoses_distance(data, sensor{i}, location{j}, plate{k}, dist{m}, false, true, .2, false);
                   
                end
            end
        end
    end
end

%% Generate corrected data from angle dataset 

% ****************** generateIDs_angle before ***********************

% sensor = {'urg','utm','lms'};
sensor = {'utm'};
location = {'indoor'};
plate = {'board', 'alu', 'steel', 'iron'};
angle = {'a0', 'a15', 'a30', 'a45', 'a60', 'a75'};

for i = 1:length(sensor)
    for j = 1:length(location)
        for k = 1:length(plate)
            for m = 1:length(angle)
                
                   data = generatePoses_angle(data, sensor{i}, location{j}, plate{k}, angle{m}, false, true, .2, false);
             
            end
        end
    end
end