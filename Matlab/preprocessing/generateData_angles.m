%sensor = {'utm'};
sensor = {'utm','lms'};
location = {'indoor'};
plate = {'board', 'alu', 'steel', 'iron'};
angle = {'a0', 'a15', 'a30', 'a45', 'a60', 'a75'};

for i = 1:length(sensor)
    for j = 1:length(location)
        for k = 1:length(plate)
            for m = 1:length(angle)
                
                   data = generatePoses_angle(data, sensor{i}, location{j}, plate{k}, angle{m}, false, false, .2, false);
             
            end
        end
    end
end