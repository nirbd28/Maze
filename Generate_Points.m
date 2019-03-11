function [point_start, point_dest]=Generate_Points(map, block_sign)
[m,n]=size(map);

while 1
    point_start=Random_Point(m,n);
    if map(point_start(1),point_start(2))~=block_sign
        break
    end
end

while 1
    point_dest=Random_Point(m,n);
    if map(point_dest(1),point_dest(2))~=block_sign && ~Compare_Points(point_start, point_dest)
        break
    end
end

end