function data = generatePoses_angle(data, sensor, location, plate, angle, plotData, corrData, qradii, forceRecompute)

corrZ = -0.265;
indoorRaw = importdata('../../../data/leica_angle.txt');

plateIDs = data.(sensor).(location).(plate).(angle).plateIDs;

if ~isfield(data.(sensor).(location).(plate), angle)
    return
end

laserIDs = data.(sensor).(location).(plate).(angle).laserIDs;
bagID = data.(sensor).(location).(plate).(angle).bagID;
folder = data.(sensor).(location).folderName;

[x, y, z] = fetchMesh(plateIDs, indoorRaw);

T = fetchTransformation(laserIDs, indoorRaw);
[x2, y2, z2] = transformMesh(T, x, y, z);

T2 = plateFrameTransform(x2, y2, z2);

% Load scanned points

loadPath = ['/home/cantor/Desktop/Robotique/sensorReflectivities/angles/', folder, 'csv_local/cut_', num2str(bagID), '.csv'];
savePath = ['/home/cantor/Desktop/Robotique/sensorReflectivities/angles/', folder, 'csv_local/result_', num2str(bagID), '.csv'];
%savePath = ['/home/cantor/Desktop/test_', num2str(bagID), '.csv'];

clear result
if ~exist(savePath, 'file') || corrData || forceRecompute
    

    if corrData
        [lx, ly, lz, intensity] = correctScan(data, sensor, location, plate, angle, plotData);
    else
        cutRaw = importdata(loadPath);
        lx = cutRaw.data(:,strcmp('"Points:0"', cutRaw.colheaders));
        ly = cutRaw.data(:,strcmp('"Points:1"', cutRaw.colheaders));
        lz = cutRaw.data(:,strcmp('"Points:2"', cutRaw.colheaders));
        intensity = cutRaw.data(:,strcmp('"Intensities"', cutRaw.colheaders));
    end
    
        [px, py, pz] = transformToPlateRef(T2, lx, ly, lz);

%     % Compute normal VS estimated normal
%     tree = kdtree_build([lx, ly, lz]);
%     est_n  = zeros(length(lx), 3);
%     
%     for j = 1:size(lx)
%         p = [lx(j), ly(j), lz(j)];
%         [idxs, angles] = kdtree_ball_query(tree, p, qradii);
%         if length(idxs) > 4
%             closePts = [lx(idxs), ly(idxs), lz(idxs)];
%             c = mean(closePts);
%             closePts = [closePts(:,1) - c(1), closePts(:,2) - c(2), closePts(:,3) - c(3)];
%             [eigVec, eigVal] = eig(closePts'*closePts);
%             eigVal = diag(eigVal);
%             est_n(j,:) = eigVec(:, eigVal == min(eigVal));
%         else
%             est_n(j,:) = [0;0;0];
%         end
%     end
                
    clusterID = zeros(size(lx));
    errors_normal = zeros(size(lx));
    errors_depth = zeros(size(lx));
    errors_est_n = zeros(size(lx));
    incidence = zeros(size(lx));
    lat = zeros(size(lx));
    lon = zeros(size(lx));
    for i = 1:size(x2, 2)
        s1 = [x2(1,i), y2(1,i), z2(1,i)];
        s2 = [x2(2,i), y2(2,i), z2(2,i)];
        s3 = [x2(3,i), y2(3,i), z2(3,i)];
        for j = 1:size(clusterID)
            p = [lx(j), ly(j), lz(j)];
            [inside, err_n, err_d, n] = isInsideTriangle(s1, s2, s3, p);
            if inside
                clusterID(j) = i;
                errors_normal(j) = err_n;
                errors_depth(j) = err_d;
                p(3) = p(3) + corrZ;
                p = p./norm(p);
                incidence(j) = pi - acos(dot(p,n));
                pp = [p(1),p(3)];
                pp = pp./norm(pp);
                nn = [n(1), n(3)];
                nn = nn ./ norm(nn);
                lat(j) = acos(dot(pp,nn));
                pp = [p(1),p(2)];
                pp = pp./norm(pp);
                nn = [n(1), n(2)];
                nn = nn ./ norm(nn);
                lon(j) = acos(dot(pp,nn));
                
%                 if dot(n, est_n(j,:)) < 0
%                     n = -n;
%                 end
%                 
%                 errors_est_n(j) = acos(dot(n, est_n(j,:)));
                
            end
        end
    end
    
    f = clusterID > 0;
    
    result(:,1) = lx(f);
    result(:,2) = ly(f);
    result(:,3) = lz(f);
    result(:,4) = errors_normal(f);
    result(:,5) = clusterID(f);
    result(:,6) = intensity(f);
    result(:,7) = incidence(f);
    result(:,8) = lat(f);
    result(:,9) = lon(f);
    result(:,10) = errors_depth(f);
    result(:,11) = errors_est_n(f);
    result(:,12) = px(f);
    result(:,13) = py(f);
    result(:,14) = pz(f);
        
    if ~(corrData || forceRecompute)
        fid = fopen(savePath, 'w');
        fprintf(fid, 'x, y, z, error_plane, clusterID, intensity, incidence, lattitude, longitude, error_depth, error_est_n, px, py, pz\n');
        fprintf(fid, '%f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f\n', result');
    end

else
    resultRaw = importdata(savePath);
    result = resultRaw.data;
    clear resultRaw
end

% index
x=1;
y=2;
z=3;
err = 4;
clus = 5;
int = 6;
inc = 7;
lattitude = 8;
longitude = 9;
err_d = 10;
err_n = 11;
px = 12;
py = 13;
pz = 14;

data.(sensor).(location).(plate).(angle).result.d = sqrt(result(:, x).^2+result(:, y).^2+result(:, z).^2);
data.(sensor).(location).(plate).(angle).result.err = result(:, err);
data.(sensor).(location).(plate).(angle).result.inc = result(:, inc);
data.(sensor).(location).(plate).(angle).result.int = result(:, int);
data.(sensor).(location).(plate).(angle).result.lat = result(:, lattitude);
data.(sensor).(location).(plate).(angle).result.lon = result(:, longitude);
data.(sensor).(location).(plate).(angle).result.err_d = result(:, err_d);
%data.(sensor).(location).(plate).(angle).result.err_n = result(:, err_n);
data.(sensor).(location).(plate).(angle).result.px = result(:, px);
data.(sensor).(location).(plate).(angle).result.py = result(:, py);
data.(sensor).(location).(plate).(angle).result.pz = result(:, pz);

  % compute area of ellipse at the intersection of the
                % laser beam cone and the plate
              
                
% 
%                                                           A'_,-'
%                                                         _,-|
%                                                   A _,-'   |
%                                                 _,o'       |
%                                             _,-'   \       |
%                                         _,-'        \      |b
%                                     _,-'             \ x   |
%                                 _,-'                  \    |
%                             _,-'                       \   |
%                         _,-'alpha                  beta \B |B"
%              Source S o----------------------------------o-o---------
%                         `-. alpha         d       (y-x)/2 \|w
%                             `-._                           o B'
%                                 `-._                       |\
%                                     `-._                   | \
%                                         `-._           b-w |  \
%                                             `-._           |   \ (y+x)/2
%                                                 `-._       |    \
%                                                     `-._   |     \
%                                                         `-.|      \
%                                                           C'`-._   \
%                                                                 `-._\
%                                                                     `o
%  http://mathforum.org/library/drmath/view/55260.html                  C

if sensor == 'utm'
   
   d = data.(sensor).(location).(plate).(angle).result.d;
   err_d = data.(sensor).(location).(plate).(angle).result.err_d;
   h = d + err_d;
   inc = data.(sensor).(location).(plate).(angle).result.inc;
   alpha = 0.0012217;
   beta = pi/2 - inc;
   x = h.*sin(alpha)./sin(beta+alpha);
   y = h.*sin(alpha)./sin(beta-alpha);
   semiMajorAxis = (x+y)./2;
   semiMinorAxis = (x+y).*sin(beta-alpha)./(2.*cos(alpha)) + (y-x).*sin(beta)./2;
   
   data.(sensor).(location).(plate).(angle).result.beamArea = pi.*semiMajorAxis.*semiMinorAxis;
end

 

clear d x y inc alpha beta semiMajorAxis semiMinorAxis
