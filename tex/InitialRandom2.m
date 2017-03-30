function [pos, vel, posAP] = InitialRandom2(N,S, AP)

% coordinates limits
AXIS_LIMIT = 300;
ABSCISSA_LIMIT = 200;

%% positions
pos = [AXIS_LIMIT * rand(N, 1) ABSCISSA_LIMIT * rand(N, 1)];

%draw access point location

if AP == 1
    posAP = [AXIS_LIMIT/2,ABSCISSA_LIMIT/2];
end
if AP == 2
    posAP = [AXIS_LIMIT/4,ABSCISSA_LIMIT/2;
        2*AXIS_LIMIT/4,ABSCISSA_LIMIT/2];
end
if AP == 3
    posAP = [AXIS_LIMIT/6,ABSCISSA_LIMIT/2;
        3*AXIS_LIMIT/6,ABSCISSA_LIMIT/2;
        5*AXIS_LIMIT/6,ABSCISSA_LIMIT/2];
end
if AP == 4
    posAP = [AXIS_LIMIT/4,ABSCISSA_LIMIT/4;
        3*AXIS_LIMIT/4,ABSCISSA_LIMIT/4;
        AXIS_LIMIT/4,3*ABSCISSA_LIMIT/4;
        3*AXIS_LIMIT/4,3*ABSCISSA_LIMIT/4;];
end
if AP == 5
    posAP = [AXIS_LIMIT/6,ABSCISSA_LIMIT/2;
        3*AXIS_LIMIT/6,(ABSCISSA_LIMIT/2 + ABSCISSA_LIMIT/5);
        5*AXIS_LIMIT/6,ABSCISSA_LIMIT/2];
end

%% speed and bearing
abs_val = S * rand(N, 1);           % random speed
angle_val = 2 * pi * rand(N, 1);    % random angle
vel = [ abs_val.*cos(angle_val) abs_val.*sin(angle_val) ];
