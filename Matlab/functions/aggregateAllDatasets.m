function allData = aggregateAllDatasets(sensor, location,  x)
% Aggregates data_distance and data_angle for a chosen sensor

dataset_dist_x = aggregateData_distance(sensor, location, x);
dataset_angle_x = aggregateData_angles(sensor , x);

allData = [dataset_dist_x ; dataset_angle_x];

