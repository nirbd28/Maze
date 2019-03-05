function [distance, points_around]=Calc_Distance_Around(point, point_dest, mat, pass_sign, dest_sign)

i=1;
distance=[];
points_around=[];
point_around_temp=[point(1)-1;point(2)]; %%% check point above
if mat(point_around_temp(1),point_around_temp(2))==pass_sign || mat(point_around_temp(1),point_around_temp(2))==dest_sign
    distance(i)=Calc_Distance(point_around_temp, point_dest);
    points_around(1,i)=point_around_temp(1);      
    points_around(2,i)=point_around_temp(2); 
    i=i+1;
end

point_around_temp=[point(1)+1;point(2)]; %%% check point below
if mat(point_around_temp(1),point_around_temp(2))==pass_sign || mat(point_around_temp(1),point_around_temp(2))==dest_sign
    distance(i)=Calc_Distance(point_around_temp, point_dest);
    points_around(1,i)=point_around_temp(1);      
    points_around(2,i)=point_around_temp(2); 
    i=i+1;
end

point_around_temp=[point(1);point(2)+1]; %%% check point right
if mat(point_around_temp(1),point_around_temp(2))==pass_sign || mat(point_around_temp(1),point_around_temp(2))==dest_sign
    distance(i)=Calc_Distance(point_around_temp, point_dest);
    points_around(1,i)=point_around_temp(1);      
    points_around(2,i)=point_around_temp(2); 
    i=i+1;
end

point_around_temp=[point(1);point(2)-1]; %%% check point left
if mat(point_around_temp(1),point_around_temp(2))==pass_sign || mat(point_around_temp(1),point_around_temp(2))==dest_sign
    distance(i)=Calc_Distance(point_around_temp, point_dest);
    points_around(1,i)=point_around_temp(1);      
    points_around(2,i)=point_around_temp(2); 
    i=i+1;
end


end