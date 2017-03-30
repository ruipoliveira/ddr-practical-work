function [pos,vel]= UpdateCoordinates(pos,vel,delta)

AXIS_LIMIT = 300;
ABSCISSA_LIMIT = 200;

pos = pos + delta*vel;

[lines, cols] = size(pos);

for i=1:lines
    if(pos(i,1)>AXIS_LIMIT)
        pos(i,1) = AXIS_LIMIT;
        vel(i,1) = -vel(i,1);
    end
    if(pos(i,2)>ABSCISSA_LIMIT)
        pos(i,2) = ABSCISSA_LIMIT;
        vel(i,2) = -vel(i,2);
    end
    for j=1:cols
        if(pos(i,j)<0)
            pos(i,j) = 0;
            vel(i,j) = -vel(i,j);
        end
    end
end

end