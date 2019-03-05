function struct_out=Update_Struct(point, point_dest, mat, struct_in, itter, pass_sign, dest_sign)

struct_in(itter).point=point;
struct_in(itter).option=struct_in(itter).option+1;

[distance, points_around]=Calc_Distance_Around(point, point_dest, mat, pass_sign, dest_sign);
struct_in(itter).max_option=length(distance);

if struct_in(itter).option>struct_in(itter).max_option
    struct_in(itter).dead_end_flag=1;
end

if ~isempty(distance)
    [distance, points_around]=Sort_Distances(distance, points_around);
end

struct_in(itter).distance=distance;
struct_in(itter).points_around=points_around;


struct_out=struct_in;
end