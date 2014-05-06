s1 = 0.5 - rand(1,3);
s2 = 0.5 - rand(1,3);
s3 = 0.5 - rand(1,3);
p  = 0.5 - rand(1,3);

[inside, err, n] = isInsideTriangle(s1, s2, s3, p);
n = n.*err;

figure
hold on
pa = patch([s1(1) s2(1) s3(1)], [s1(2) s2(2) s3(2)], [s1(3) s2(3) s3(3)], [1, 1, 1]);
if inside
    set(pa,'FaceColor','g')
else
    set(pa,'FaceColor','r')
end

plot3(p(1), p(2), p(3), 'x')
%quiver3(p(1), p(2), p(3), n(1), n(2), n(3), 0) Index exceeds matrix dimensions.
inside
err
axis equal