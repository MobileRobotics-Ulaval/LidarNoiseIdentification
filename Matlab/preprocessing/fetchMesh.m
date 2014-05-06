function [x, y, z] = fetchMesh(plateIDs, rawFile)

% Build mesh
meshOrder = [1, 2, 6; 2, 5, 6; 2, 3, 5; 3, 4, 5];
x = [];
y = [];
z = [];
for i = 1:size(meshOrder, 1)
f = rawFile(:, 1) == plateIDs(meshOrder(i,1)) | rawFile(:, 1) == plateIDs(meshOrder(i,2)) | rawFile(:, 1) == plateIDs(meshOrder(i,3));
    x = [x, rawFile(f, 2)];
    y = [y, rawFile(f, 3)];
    z = [z, rawFile(f, 4)];
end
