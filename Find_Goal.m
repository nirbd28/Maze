function [points_route, map_out]=Find_Goal(map_in, point_start, point_dest, dest_sign, start_sign, pass_sign)

[m,n]=size(map_in);

%%%%% mark points
map_in(point_dest(1),point_dest(2))=dest_sign;
map_in(point_start(1),point_start(2))=start_sign;

max_itter=m*n;
for i=1:max_itter
   struct(i).point=[]; 
   struct(i).points_around=[];
   struct(i).distance=[];
   struct(i).option=0;
   struct(i).max_option=[];
   struct(i).dead_end_flag=0;    
end
%%%%%

point=point_start;
itter=1;
while 1
    map_in(point(1),point(2))=itter;% marking
    struct=Update_Struct(point, point_dest, map_in, struct, itter, pass_sign, dest_sign);
    
    if struct(1).dead_end_flag==1;% finding goal failed
       display('Finding the goal failed');
       break; 
    end
    
    if struct(itter).dead_end_flag==1% meeting dead end
        struct=Reset_Struct(struct, itter);  
        map_in(point(1),point(2))=pass_sign;
        itter=itter-1;
        point=Point_Placement(struct(itter).point);
        continue
    end
    
    point=Point_Placement(struct(itter).points_around(:,struct(itter).option));
    
    if Compare_Points(point, point_dest)% reached goal
        break
    end
    itter=itter+1;
end

for i=1:itter
   points_route(:,i)=Point_Placement(struct(i).point);   
end

map_out=map_in;

end