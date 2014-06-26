function data = generatePoses_old(data, sensor, location, plate, dist, plotData, corrData, qradii, forceRecompute)

corrZ = -0.265;
indoorRaw = importdata(['./data/leica_', location, '.txt']);

plateIDs = data.(sensor).(location).(plate).plateIDs;

if ~isfield(data.(sensor).(location).(plate), dist)
    return
end

laserIDs = data.(sensor).(location).(plate).(dist).laserIDs;
bagID = data.(sensor).(location).(plate).(dist).bagID;
folder = data.(sensor).(location).folderName;

[x, y, z] = fetchMesh(plateIDs, indoorRaw);
T = fetchTransformation(laserIDs, indoorRaw);

[x2, y2, z2] = transformMesh(T, x, y, z);

% Load scanned points

loadPath = ['/Volumes/ASL-DATASET/datasets/laser3D/sensorReflectivities/', location, '/', folder, 'csv_local/cut_', num2str(bagID), '.csv'];
savePath = ['/Volumes/ASL-DATASET/datasets/laser3D/sensorReflectivities/', location, '/', folder, 'csv_local/result_', num2str(bagID), '.csv'];

clear result
if ~exist(savePath, 'file') || corrData || forceRecompute
    

    if corrData
        [lx, ly, lz, intensity] = correctScan(data, sensor, location, plate, dist, plotData);
    else
        cutRaw = importdata(loadPath);
        lx = cutRaw.data(:,strcmp('"Points:0"', cutRaw.colheaders));
        ly = cutRaw.data(:,strcmp('"Points:1"', cutRaw.colheaders));
        lz = cutRaw.data(:,strcmp('"Points:2"', cutRaw.colheaders));
        intensity = cutRaw.data(:,strcmp('"Intensities"', cutRaw.colheaders));
    end
    
    
    % Compute normal VS estimated normal
    tree = kdtree_build([lx, ly, lz]);
    est_n  = zeros(length(lx), 3);
    
    for j = 1:size(lx)
        p = [lx(j), ly(j), lz(j)];
        [idxs, dists] = kdtree_ball_query(tree, p, qradii);
        if length(idxs) > 4
            closePts = [lx(idxs), ly(idxs), lz(idxs)];
            c = mean(closePts);
            closePts = [closePts(:,1) - c(1), closePts(:,2) - c(2), closePts(:,3) - c(3)];
            [eigVec, eigVal] = eig(closePts'*closePts);
            eigVal = diag(eigVal);
            est_n(j,:) = eigVec(:, eigVal == min(eigVal));
        else
            est_n(j,:) = [0;0;0];
        end
    end
                
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
                incidence(j) = acos(dot(p,n));
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
                
                if dot(n, est_n(j,:)) < 0
                    n = -n;
                end
                
                errors_est_n(j) = acos(dot(n, est_n(j,:)));
                
                
                
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
    
    if ~(corrData || forceRecompute)
        fid = fopen(savePath, 'w');
        fprintf(fid, 'x, y, z, error_plane, clusterID, intensity, incidence, lattitude, longitude, error_depth, error_est_n\n')
        fprintf(fid, '%f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f\n', result');
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

data.(sensor).(location).(plate).(dist).result.d = sqrt(result(:, x).^2+result(:, y).^2+result(:, z).^2);
data.(sensor).(location).(plate).(dist).result.err = result(:, err);
data.(sensor).(location).(plate).(dist).result.inc = result(:, inc);
data.(sensor).(location).(plate).(dist).result.int = result(:, int);
data.(sensor).(location).(plate).(dist).result.lat = result(:, lattitude);
data.(sensor).(location).(plate).(dist).result.lon = result(:, longitude);
data.(sensor).(location).(plate).(dist).result.err_d = result(:, err_d);
%data.(sensor).(location).(plate).(dist).result.err_n = result(:, err_n);

%% Print info

if corrData
    fprintf('Corrected error mean:%f, std:%f \n', mean(result(:,err_d)), std(result(:,err_d)))
else
    fprintf('Error mean:%f, std:%f \n', mean(result(:,err_d)), std(result(:,err_d)))
end

%%
% Plots
if plotData

    % FIGURE Article reflection section
    h = figure;
    c = fireprint;
    c = c(1:end-30, :);
    scatter(result(:,y), result(:,z)+corrZ, 3, result(:,err_d), 'filled')
    set(gca,'XDir','reverse')
    set(gca, 'XTickLabel', '')
    set(gca, 'YTickLabel', '')
    axis equal tight
    caxis([-0.05, 0.05])
    xlim([-1 1])
    ylim([-0.42 0.42])
    colormap(c)
    
    saveFileName = [sensor, '_', location, '_', plate, '_', dist];
    saveFigArticle(h, ['../article/figures/', saveFileName, '.eps'], 'bitmapBackground', true, 'columnWidth', 125);
    delete(['../article/figures/', saveFileName, '.pdf'])
    
    % end article
    
    
    
%     figure
%     hold on
%     %patch(y2, z2, 2.*ones(size(x)));
%     %patch(y2, z2, [0.7, 0.7, 0.7]);
%     scatter(result(:,y), result(:,z)+corrZ, 10, result(:,clus), 'filled')
%     set(gca,'XDir','reverse')
%     axis equal
%     axis tight
%     xlabel('y (m)')
%     ylabel('z (m)')
%     colormap(fireprint(256, 'maxColor', [0.8, 0.8, 0.8]))
% 
%     figure
%     scatter(result(:,y), result(:,z)+corrZ, 10, result(:,err), 'filled')
%     set(gca,'XDir','reverse')
%     axis equal
%     axis tight
%     caxis([-0.05, 0.05])
%     %title('Error on plane')
%     xlabel('y (m)')
%     %ylabel('z (m)')
%     colormap(fireprint)
%     colorbar

    figure
    %subplot(3,1,1)
    scatter(result(:,y), result(:,z)+corrZ, 3, result(:,err_d), 'filled')
    set(gca,'XDir','reverse')
    axis equal
    axis tight
    xlim([-1 1])
    
    caxis([-0.05, 0.05])
    %title('Error on beam depth')
    xlabel('y (m)')
    ylabel('z (m)')
    colormap(fireprint)
    %colorbar
    
%     figure
%     %subplot(3,1,1)
%     %scatter(result(:,y), result(:,z)+corrZ, 10, log(result(:,int)), 'filled')
%     scatter(result(:,y), result(:,z)+corrZ, 10, result(:,int), 'filled')
%     set(gca,'XDir','reverse')
%     daspect([1 1 1])
%     xlim([min(result(:,y)), max(result(:,y))]);
%     ylim([min(result(:,z)+corrZ), max(result(:,z)+corrZ)]);
%     %caxis([0, 10000])
%     %title('Intensity')
%     xlabel('y (m)', 'fontsize',20,'fontweight','b')
%     ylabel('z (m)', 'fontsize',20,'fontweight','b')
%     colormap(fireprint(256, 'invert', 1))
%     colorbar
%     set(gca, 'fontsize',16)
%     
%     figure
%     %subplot(3,1,2)
%     scatter(result(:,y), result(:,z)+corrZ, 10, result(:,err_n), 'filled')
%     set(gca,'XDir','reverse')
%     caxis([0.0, 0.3])
%     daspect([1 1 1])
%     xlim([min(result(:,y)), max(result(:,y))]);
%     ylim([min(result(:,z)+corrZ), max(result(:,z)+corrZ)]);
%     %title('Error on estimated normal (rad)')
%     xlabel('y (m)', 'fontsize',20,'fontweight','b')
%     ylabel('z (m)', 'fontsize',20,'fontweight','b')
%     colormap(fireprint(256, 'invert', 1))
%     colorbar
%     set(gca, 'fontsize',16)
    
    
 
    
%% FIGURES for article
    % generatePoses(data, 'utm', 'indoor', 'alu', 'd1_0', true, false, 0.1, true);
    % Article: CLUSTERS
    c = fireprint;
    c = c(1:end-30, :);
    h1=figure;
    %subaxis(3,1,1, 'Spacing', 0.02, 'Padding', 0, 'Margin', 0.01)
    hold on
    scatter(result(:,y), result(:,z)+corrZ, 3, result(:,clus), 'filled')
    set(gca,'XDir','reverse')
    axis equal tight
    caxis([0 4])
    ylabel('z (m)')
    xlabel('y (m)')
    %set(gca, 'XTickLabel', '')
    colormap(c)
    colorbar('location', 'NorthOutside')
%% Save for thesis
saveFigArticle(gcf, '../../../../../Thesis/redaction/fig/augRobust/iron_cluster.eps', 'bitmapBackground', true, 'columnWidth', 140);
delete('../../../../../Thesis/redaction/fig/augRobust/iron_cluster.pdf')
    
%% Article: ERROR BEAM
    %subaxis(3,1,2, 'Spacing', 0.02, 'Padding', 0, 'Margin', 0.01)
    figure
    scatter(result(:,y), result(:,z)+corrZ, 3, 100.*result(:,err_d), 'filled')
    set(gca,'XDir','reverse')
    set(gca, 'YTickLabel', '')
    axis equal tight
    %ylabel('z (m)')
    xlabel('y (m)')
    caxis([1, 5])
    colormap(c)
    colorbar('location', 'NorthOutside')
%% Save for thesis
saveFigArticle(gcf, '../../../../../Thesis/redaction/fig/augRobust/iron_error.eps', 'bitmapBackground', true, 'columnWidth', 110);
delete('../../../../../Thesis/redaction/fig/augRobust/iron_error.pdf')

%%    

    % Article: ERROR PLANE NORMAL
%     subaxis(4,1,3, 'Spacing', 0.03, 'Padding', 0, 'Margin', 0.01)
%     scatter(result(:,y), result(:,z)+corrZ, 3, result(:,err_n), 'filled')
%     set(gca,'XDir','reverse')
%     set(gca, 'XTickLabel', '')
%     axis equal tight
%     ylabel('z (m)')
%     caxis([0.0, 0.3])
%     colormap(fireprint(256, 'invert', 1))
%     colorbar
    
%% Article: INTENSITY
    %subaxis(3,1,3, 'Spacing', 0.02, 'Padding', 0, 'Margin', 0.01)
    figure
    scatter(result(:,y), result(:,z)+corrZ, 3, result(:,int)./1000, 'filled')
    set(gca,'XDir','reverse')
    set(gca, 'YTickLabel', '')
    axis equal tight
    xlabel('y (m)')
    %ylabel('z (m)')
    caxis([1.5 3.2])
    colormap(c)
    colorbar('location', 'NorthOutside')
%% Save for thesis
saveFigArticle(gcf, '../../../../../Thesis/redaction/fig/augRobust/iron_intensity.eps', 'bitmapBackground', true, 'columnWidth', 110);
delete('../../../../../Thesis/redaction/fig/augRobust/iron_intensity.pdf')

%% save for article (with subplots)
    saveFigArticle(h1, '../article/figures/utmIndoorAluD1_0.eps', 'bitmapBackground', true, 'columnWidth', 226);
    delete('../article/figures/utmIndoorAluD1_0.pdf')
    % end article figures
    
    
    figure
    subplot(1,3,1)
    hist(result(:,err), 40)
    xlabel('Error')
    subplot(1,3,2)
    hist(result(:,int), 40)
    xlabel('Intensity')
    subplot(1,3,3)
    d = sqrt(result(:, x).^2+result(:, y).^2+result(:, z).^2);
    hist(d, 40)
    xlabel('Beam distance (m)')

    
    
    
    figure
    hold on
    plot(result(:,y), result(:,z)+corrZ, 'b.')
    f = result(:,err_d) > 0.05;
    plot(result(f,y), result(f,z)+corrZ, 'ro')
    set(gca,'XDir','reverse')
    axis equal
    title('Custom segmentation')
    
    figure
    %subplot(3,1,3)
    scatter(result(:,y), result(:,z)+corrZ, 10, result(:,inc))
    set(gca,'XDir','reverse')
    axis equal
    
    figure
    %subplot(3,1,3)
    scatter(result(:,y), result(:,z)+corrZ, 10, result(:,lattitude))
    set(gca,'XDir','reverse')
    axis equal
    title('Lattitude')

     figure
    %subplot(3,1,3)
    scatter(result(:,y), result(:,z)+corrZ, 10, result(:,longitude))
    set(gca,'XDir','reverse')
    axis equal
    title('Longitude')
    
    figure
    hold on
    plot(result(:,int), result(:,err), 'x')
    y = smooth(result(1:20:end,int), result(1:20:end,err), 500, 'rlowess');
    plot(result(1:20:end,int), y, 'r.')
    xlabel('Intensity')
    ylabel('Error')
    ylim([-0.03, 0.03])

    figure
    hold on
    plot(result(:,inc), result(:,err), 'x')
    y = smooth(result(1:20:end,inc), result(1:20:end,err), 0.2);
    plot(result(1:20:end,inc), y, 'r.')
    xlabel('Incidence (rad)')
    ylabel('Error')
    ylim([-0.03, 0.03])
    
    figure
    hold on
    plot(d, result(:,err), 'x')
    y = smooth(d(1:20:end), result(1:20:end,err), 0.2);
    plot(d(1:20:end), y, 'r.')
    xlabel('Beam distance (m)')
    ylabel('Error')
    ylim([-0.03, 0.03])    

end
