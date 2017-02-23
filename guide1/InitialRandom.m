% Generates random positions between coordinates and the respective speed 
% in Km/hr for each point

function [pos,vel]=InitialRandom(Number_of_points,Maximum_speed)

  %% coordinates
  AXIS_LIMIT = 300;
  ABSCISSA_LIMIT = 200;
  pos = [AXIS_LIMIT * rand(Number_of_points, 1) ABSCISSA_LIMIT * rand(Number_of_points, 1)];
  
  %% speed and bearing 
  S = Maximum_speed / 3.6; % conversion to m/s
  abs_val = S*rand(Number_of_points, 1);
  angle_val = 2*pi*rand(Number_of_points,1);
  vel = [abs_val.*cos(angle_val) abs_val.*sin(angle_val)];
  
end