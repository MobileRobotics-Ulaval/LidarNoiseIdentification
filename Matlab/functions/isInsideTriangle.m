function [inside, err_n, err_d, n] = isInsideTriangle(s1, s2, s3, p)

% bug : retourne inside = 1 parfois quand ce n'est pas le cas

% Compute vectors        
v0 = s3 - s1;
v1 = s2 - s1;
v2 = p - s1;

% Compute dot products
dot00 = dot(v0, v0);
dot01 = dot(v0, v1);
dot02 = dot(v0, v2);
dot11 = dot(v1, v1);
dot12 = dot(v1, v2);

% Compute barycentric coordinates
invDenom = 1 / (dot00 * dot11 - dot01 * dot01);
u = (dot11 * dot02 - dot01 * dot12) * invDenom;
v = (dot00 * dot12 - dot01 * dot02) * invDenom;

% Check if point is in triangle
inside = (u >= 0) & (v >= 0) & (u + v < 1);

% Projective error
n = cross(v1, v0);
n = n./norm(n);

err_n = -dot(n, p-s1); % Error projected on the plane normal
err_d = (err_n*norm(p))/dot(p,n); % Error on the beam depth
