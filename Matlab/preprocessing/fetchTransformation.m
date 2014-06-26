function T = fetchTransformation(laserIDs, rawFile)

% construct transformation matrix T (leica <- scanner)

p0 = rawFile(rawFile(:, 1) == laserIDs(1), 2:4);
p1 = rawFile(rawFile(:, 1) == laserIDs(2), 2:4);
p2 = rawFile(rawFile(:, 1) == laserIDs(3), 2:4);

center = mean([p0; p1; p2]);
ny = p2-p1;
nz = cross(ny, p0-p1);
nx = cross(ny, nz);

nx = nx./norm(nx);
ny = ny./norm(ny);
nz = nz./norm(nz);

T = [nx', ny', nz', center'];
T = [T; 0 0 0 1];

qa = -0.999933;
qb = 0.000641278;
qc = 0.00992878;
qd = -0.00594518;
t_corr = [0.01596; -0.02429; 0.606493];

R_corr = [qa^2+qb^2-qc^2-qd^2, 2*qb*qc - 2*qa*qd, 2*qb*qd + 2*qa*qc;...
               2*qb*qc + 2*qa*qd, qa^2-qb^2+qc^2-qd^2, 2*qc*qd - 2*qa*qb;...
               2*qb*qd - 2*qa*qc, 2*qc*qd + 2*qa*qb, qa^2-qb^2-qc^2+qd^2];

 T_corr = [R_corr, t_corr];
 T_corr = [T_corr; 0 0 0 1];
 
 T_corr = inv(T_corr);
 
% We are interested in expressing points in scanner frame:
T = inv(T*T_corr);