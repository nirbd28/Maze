clc; clear all; close all;
%%
clc; clear all; close all;

%%%%%%%%%%%%%%% dimensions
m=12;% rows
n=12;% columns

%%%%%%%%%%%%%%% signs
block_sign=-500;
pass_sign=0;
dest_sign=-1;

%%%%%%%%%%%%%%% create mat

%%%%% create blocks
p=0.25;% the higher = more blocks
mat = binornd(1,p,[m,n]);
for i=1:m
   for j=1:n
      if mat(i,j)==1
         mat(i,j)=block_sign; 
      end
   end
end
%%%%% create pass
for i=1:m
   for j=1:n
      if mat(i,j)==0
         mat(i,j)=pass_sign; 
      end
   end
end

%%%%% create edges
mat(1:m,1)=block_sign;
mat(1,1:n)=block_sign;
mat(1:m,n)=block_sign;
mat(m,1:n)=block_sign;

%%%%% generate start and dest points
while 1
    point_start=Random_Point(m,n);
    if mat(point_start(1),point_start(2))~=block_sign
        break
    end
end

while 1
    point_dest=Random_Point(m,n);
    if mat(point_dest(1),point_dest(2))~=block_sign && ~Compare_Points(point_start, point_dest)
        break
    end
end

%%%%% mark points
mat(point_dest(1),point_dest(2))=dest_sign;
start_sign=1;
mat(point_start(1),point_start(2))=start_sign;

%%%%%%%%%%%%%%% find goal

%%%%% init struct
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
    mat(point(1),point(2))=itter;% marking
    struct=Update_Struct(point, point_dest, mat, struct, itter, pass_sign, dest_sign);
    
    if struct(1).dead_end_flag==1;% finding goal failed
       display('Finding the goal failed');
       break; 
    end
    
    if struct(itter).dead_end_flag==1% meeting dead end
        struct=Reset_Struct(struct, itter);  
        mat(point(1),point(2))=pass_sign;
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

%%%%%%%%%%%%%%% plot matrix
for i=1:m
   for j=1:n
      val=mat(i,j);
      switch val
          case pass_sign
              scatter(i,j,'c');
          case block_sign
              scatter(i,j,'k','*');
          case 1
              scatter(i,j,50,'r','d');
              text(i,j,num2str(val),'Color','b','FontSize',14);
          case dest_sign
              scatter(i,j,300,'g','p');
          otherwise
              scatter(i,j,'x');
              text(i,j,num2str(val),'Color','b','FontSize',14);
      end
      hold on;
   end
end





