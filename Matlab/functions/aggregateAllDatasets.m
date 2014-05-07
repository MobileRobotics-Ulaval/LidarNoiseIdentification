function allData = aggregateAllDatasets(sensor, x)
% Aggregates data_distance and data_angle for a chosen sensor
% Only indoor since data_angle only exists for indoor data

load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_angle.mat';
load '/home/cantor/Desktop/Robotique/matlab_scripts/data/data_distance.mat';

dataset_dist_x = aggregateData_distance(sensor,'indoor', x);
dataset_angle_x = aggregateData_angles(sensor , x);
allData = [dataset_dist_x ; dataset_angle_x];

