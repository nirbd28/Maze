function [distance_out, points_around_out]=Sort_Distances(distance_in, points_around_in)

inf_distance=1e3;
for i=1:length(distance_in)
   [min_val, min_i]=min(distance_in);
   distance_out(i)=distance_in(min_i); 
   distance_in(min_i)=inf_distance;  
   points_around_out(1,i)=points_around_in(1,min_i);
   points_around_out(2,i)=points_around_in(2,min_i);
end

end