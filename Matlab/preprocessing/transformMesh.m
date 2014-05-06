function [x2, y2, z2] = transformMesh(T, x, y, z)

p = [x(:)'; y(:)'; z(:)'; ones(size(z(:)'))];
p = T * p;

x2 = reshape(p(1,:), 3, 4);
y2 = reshape(p(2,:), 3, 4);
z2 = reshape(p(3,:), 3, 4);