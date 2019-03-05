function struct_out=Reset_Struct(struct_in, index)

struct_in(index).point=[]; 
struct_in(index).points_around=[];
struct_in(index).distance=[];
struct_in(index).option=0;
struct_in(index).max_option=[];
struct_in(index).dead_end_flag=0;

struct_out=struct_in;
end