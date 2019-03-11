clc; clear all; close all;
%%
clc; clear all; close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% create map

%%%%%%%%%%%%%%% dimensions
m=20;% rows
n=20;% columns

%%%%%%%%%%%%%%% signs
block_sign=-500;
pass_sign=0;
dest_sign=-1;
start_sign=1;
%%%%%%%%%%%%%%%

p=0.1;% the higher = more blocks

%%%%%%%%%%%%%%% generate  map
map=Generate_Map(m, n, block_sign, pass_sign, p);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% generate start and dest points
num_of_exe=3;
for i=1:num_of_exe
    [point_start(i).point, point_dest(i).point]=Generate_Points(map, block_sign);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% find goal
for i=1:num_of_exe
    [points_route(i).point]=Find_Goal(map, point_start(i).point, point_dest(i).point, dest_sign, start_sign, pass_sign);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plot map
figure;
Plot_Map(map, block_sign, pass_sign);
hold on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plot points route

color={'b', 'r', 'm'};
hold on;
for i=1:num_of_exe
    Plot_Points_Route(points_route(i).point, color{i});
    hold on;
end



