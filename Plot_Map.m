function Plot_Map(map, block_sign, pass_sign)

[m,n]=size(map);

for i=1:m
   for j=1:n
      val=map(i,j);
      switch val
          case pass_sign
              scatter(i,j,'c');
          case block_sign
              scatter(i,j,'k','*');
      end
      hold on;
   end
end


end