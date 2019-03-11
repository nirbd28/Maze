function map=Generate_Map(m, n, block_sign, pass_sign, p)

map = binornd(1,p,[m,n]);
for i=1:m
   for j=1:n
      if map(i,j)==1
         map(i,j)=block_sign; 
      end
   end
end
%%%%% create pass
for i=1:m
   for j=1:n
      if map(i,j)==0
         map(i,j)=pass_sign; 
      end
   end
end

%%%%% create edges
map(1:m,1)=block_sign;
map(1,1:n)=block_sign;
map(1:m,n)=block_sign;
map(m,1:n)=block_sign;

end