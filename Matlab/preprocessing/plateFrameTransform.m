function [T2] = plateFrameTransform(x2, y2, z2)
% Creating transformation matrix to express points in the reference of the plate

p0 = [x2(1,1), y2(1,1), z2(1,1)]; % bas
p1 = [x2(2,1), y2(2,1), z2(2,1)]; % droite
p2 = [x2(3,1), y2(3,1), z2(3,1)]; % haut

center = -p2; % (0.0.0) en haut a gauche de la plaque
nx = p1-p2;
nz = cross(nx, p0-p2);
ny = cross(nz, nx);

nx = nx./norm(nx);
ny = ny./norm(ny);
nz = nz./norm(nz);

R = [nx', ny', nz'];
center = R\center'; % inv(R)*center pour tourner aussi le point de référence
T2 = [inv(R), center];
T2 = [T2; 0 0 0 1];

end

