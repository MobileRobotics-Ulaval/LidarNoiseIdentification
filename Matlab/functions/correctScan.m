function [x_hat, y_hat, z_hat, i] = correctScan(data, sensor, location, plate, dist, plotData)

bagID = data.(sensor).(location).(plate).(dist).bagID;
folder = data.(sensor).(location).folderName;

loadPath = ['/Volumes/ASL-DATASET/datasets/laser3D/sensorReflectivities/', location, '/', folder, 'csv_local/cut_', num2str(bagID), '.csv'];

cutRaw = importdata(loadPath);

x = cutRaw.data(:,strcmp('"Points:0"', cutRaw.colheaders));
y = cutRaw.data(:,strcmp('"Points:1"', cutRaw.colheaders));
z = cutRaw.data(:,strcmp('"Points:2"', cutRaw.colheaders));


i = cutRaw.data(:,strcmp('"Intensities"', cutRaw.colheaders));

d = sqrt(x.^2+y.^2+z.^2);
yaw = atan(y./x);
theta = acos(z./d);

% Correction model
if sensor == 'utm'
    d = d + 0.016.*exp(-((i-1277)./197).^2)+0.045*exp(-((i-2523)./1710).^2)+3.181e-06.*i-0.03;
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