function [x_hat, y_hat, z_hat, int] = correctScan(data, sensor, location, plate, dist, plotData)

bagID = data.(sensor).(location).(plate).(dist).bagID;
folder = data.(sensor).(location).folderName;

dataType = dist(1);
dataType = char(dataType);
dataType = dataType(1);

if strcmp('d', dataType) % distance dataset
    loadPath = ['/home/cantor/Desktop/Robotique/sensorReflectivities/', location, '/', folder, 'csv_local/cut_', num2str(bagID), '.csv'];
elseif strcmp('a', dataType) % angle dataset
    loadPath = ['/home/cantor/Desktop/Robotique/sensorReflectivities/angles/', folder, 'csv_local/cut_', num2str(bagID), '.csv'];
end 
    
cutRaw = importdata(loadPath);

x = cutRaw.data(:,strcmp('"Points:0"', cutRaw.colheaders));
y = cutRaw.data(:,strcmp('"Points:1"', cutRaw.colheaders));
z = cutRaw.data(:,strcmp('"Points:2"', cutRaw.colheaders));


int = cutRaw.data(:,strcmp('"Intensities"', cutRaw.colheaders));

d = sqrt(x.^2+y.^2+z.^2);
yaw = atan(y./x);
theta = acos(z./d);

% Correction model


if strcmp(sensor,'utm')
    load '/home/cantor/Desktop/Robotique/matlab_scripts/data/utm_medInt.mat';
    load '/home/cantor/Desktop/Robotique/matlab_scripts/data/utm_medErr.mat';
    correction = correctionFunction(utm_medInt, utm_medErr, int);
    d = d + correction;
elseif strcmp(sensor, 'lms')
    load '/home/cantor/Desktop/Robotique/matlab_scripts/data/lms_medInt.mat';
    load '/home/cantor/Desktop/Robotique/matlab_scripts/data/lms_medErr.mat';
    correction = correctionFunction(lms_medInt, lms_medErr, int);
    d = d + correction;
end

x_hat = d.*sin(theta).*cos(yaw);
y_hat = d.*sin(theta).*sin(yaw);
z_hat = d.*cos(theta);

if plotData
    figure
    hold on
    plot3(x, y, z, '.r')
    plot3(x_hat, y_hat, z_hat, '.b')
    axis equal
    axis tight
end