function Plot_Points_Route(points_route, color)

for i=1:length(points_route)
    x=points_route(1,i);
    y=points_route(2,i);
    
    scatter(x,y,'x',color);
    text(x,y,num2str(i),'Color',color,'FontSize',14);
    
    hold on;
end

end