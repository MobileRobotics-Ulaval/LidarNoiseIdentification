function allData = aggregateAllDatasets(data_dist, data_angle, sensor, location,  x)
% Aggregates data_distance and data_angle for a chosen sensor

dataset_dist_x = aggregateData_distance(data_dist, sensor, location, x);
dataset_angle_x = aggregateData_angles(data_angle, sensor , x);

allData = [dataset_dist_x ; dataset_angle_x];

