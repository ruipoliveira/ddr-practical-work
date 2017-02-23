function [pos,vel]= UpdateCoordinates(pos,vel,delta)

  %% coordinates
  AXIS_LIMIT = 300;
  ABSCISSA_LIMIT = 200;

  pos = pos + delta*vel;
  vel = vel;
    
  [lines, cols] = size(pos);  
    
  for i=1:lines
    for j=1:cols
      if(pos(i,j)<0)
        pos(i,j) = 0;
        vel(i,j) = -vel(i,j);
      end
      if(pos(i,j)>ABSCISSA_LIMIT)
        pos(i,j) = ABSCISSA_LIMIT;
        vel(i,j) = -vel(i,j);
      end
      if(pos(i,j)<0)
        pos(i,j) = 0;
        vel(i,j) = -vel(i,j);
      end
      if(pos(i,j)>AXIS_LIMIT)  
        pos(i,j) = AXIS_LIMIT;
        vel(i,j) = -vel(i,j);
      end
    end
  end

end