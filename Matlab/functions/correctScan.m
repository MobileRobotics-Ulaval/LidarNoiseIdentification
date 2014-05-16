function [x_hat, y_hat, z_hat, i] = correctScan(data, sensor, location, plate, dist, plotData)

bagID = data.(sensor).(location).(plate).(dist).bagID;
folder = data.(sensor).(location).folderName;

loadPath = ['/home/cantor/Desktop/Robotique/sensorReflectivities/', location, '/', folder, 'csv_local/cut_', num2str(bagID), '.csv'];

cutRaw = importdata(loadPath);

x = cutRaw.data(:,strcmp('"Points:0"', cutRaw.colheaders));
y = cutRaw.data(:,strcmp('"Points:1"', cutRaw.colheaders));
z = cutRaw.data(:,strcmp('"Points:2"', cutRaw.colheaders));


i = cutRaw.data(:,strcmp('"Intensities"', cutRaw.colheaders));

d = sqrt(x.^2+y.^2+z.^2);
yaw = atan(y./x);
theta = acos(z./d);

% Correction model
if strcmp(sensor,'utm')
    d = d + -0.021.*exp(-((i-616.7)./409).^2)+0.02.*exp(-((i-2400)./800).^2)+4.892e-7.*i+0.00854;
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