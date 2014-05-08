function allData = aggregateAllDatasets(sensor, location,  x)
% Aggregates data_distance and data_angle for a chosen sensor

load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';

dataset_dist_x = aggregateData_distance(sensor, location, x);
dataset_angle_x = aggregateData_angles(sensor , x);
allData = [dataset_dist_x ; dataset_angle_x];

