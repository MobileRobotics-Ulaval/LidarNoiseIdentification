%% Generate data from angle dataset 
% *** generateIDs_angle before ***

sensor = {'utm'};
location = {'indoor'};
plate = {'alu'};
angle = {'a0', 'a75'};

for i = 1:length(sensor)
    for j = 1:length(location)
        for k = 1:length(plate)
            for m = 1:length(angle)
                
                   data = generatePoses_angle(data, sensor{i}, location{j}, plate{k}, angle{m}, false, false, .2, false);
             
            end
        end
    end
end


%%
plate = 'alu';
sensor = 'utm';
dataSet = data_angle;
var = 'px';

figure;
plot(dataSet.(sensor).indoor.(plate).a0.result.(var), dataSet.(sensor).indoor.(plate).a0.result.err_d, '.k')
hold on;
plot(dataSet.(sensor).indoor.(plate).a15.result.(var), dataSet.(sensor).indoor.(plate).a15.result.err_d, '.r')
plot(dataSet.(sensor).indoor.(plate).a30.result.(var), dataSet.(sensor).indoor.(plate).a30.result.err_d, '.g')
plot(dataSet.(sensor).indoor.(plate).a45.result.(var), dataSet.(sensor).indoor.(plate).a45.result.err_d, '.b')
plot(dataSet.(sensor).indoor.(plate).a60.result.(var), dataSet.(sensor).indoor.(plate).a60.result.err_d, '.y')
plot(dataSet.(sensor).indoor.(plate).a75.result.(var), dataSet.(sensor).indoor.(plate).a75.result.err_d, '.c')


