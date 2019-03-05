function distance=Calc_Distance(point, point_dest)

distance=(point(1)-point_dest(1)).^2 + (point(2)-point_dest(2)).^2;
distance=sqrt(distance);

end