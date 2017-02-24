%Parameters initialization:
N= 100; % Number of mobile nodes
W= 40; % Radio range (in meters)
S= 15; % Maximum speed (in Km/h)
delta= 1; % Difference between consecutive time instants (in seconds)
%T= 3600; % No. of time instants of the simulation
T=3600;

S= S/3.6; % Conversion of maximum speed to m/s
results= zeros(1,T); % Initialization of the results array

% Generation of initial coordinates, speed and direction of mobile nodes:
[pos,vel]= InitialRandom(N,S);

% Visualize node positions:
figure(1)
plot(pos(:,1),pos(:,2),'o','MarkerEdgeColor','b','MarkerFaceColor','b')
axis([0 300 0 200])
grid on
% Simulation cycle running all time instants iter:
for iter= 1:T
  hold off
  % Visualize updated node positions:
  plot(pos(:,1),pos(:,2),'o','MarkerEdgeColor','b','MarkerFaceColor','b')
  axis([0 300 0 200])
  hold on
  
  % Compute the node pairs with direct connections:
  L= ConnectedList(N,pos,W);
  % Compute the no. of connected node pairs of time instant iter:
  %results(iter)= AverageConnectedNodePairs(N,L);
  % Update node coordinates and speed values:
  [pos,vel]= UpdateCoordinates(pos,vel,delta);
  pause(0.01)
end

% Plot in a different window the simulation results:
figure(2)
plot((1:T)',results')

% Compute the final result:
FinalResult = average(results);

%function [pos,vel]= InitialRandom(N,S)
%  %Computes a matrix ‘pos’ of N rows and 2 columns with the coordinates of nodes (see Section 5.1) and a matrix ‘vel’ of N rows and 2 columns with the initial horizontal and vertical speed components of nodes (see Section 5.2).
%end

%function L= ConnectedList(N,pos,W)
%  %Computes a matrix ‘L’ of 2 columns with the node pairs such that their distance is not higher than W.
%end

function o= AverageConnectedNodePairs(N,L)
  %Computes a value ‘o’ with the no. of connected node pairs based on the input matrix ‘L’ of node pairs with direct connections (see Section 4.1).
end

%function [pos,vel]= UpdateCoordinates(pos,vel,delta)
%  %Updates the matrices ‘pos’ and ‘vel’ based on their input values and delta.
%end