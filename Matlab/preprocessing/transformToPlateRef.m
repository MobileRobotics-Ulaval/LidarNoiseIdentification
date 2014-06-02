function [ x2, y2, z2 ] = transformToPlateRef(T2, x, y ,z)
%  transform points to reference of the plate

p = [x(:)'; y(:)'; z(:)'; ones(size(z(:)'))];
p = (T2 * p)';

x2 = p(:,1);
y2 = p(:,2);
z2 = p(:,3);

end

