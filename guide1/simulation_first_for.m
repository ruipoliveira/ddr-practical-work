results = []
for pp=1:5
    N=30;
    results(1,1) = N;
    while(N < 130)
    %Parameters initialization:
    %N= 100; % Number of mobile nodes
    W= 60; % Radio range (in meters)
    S= 3; % Maximum speed (in Km/h)
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
          figure(1)
          hold off
          % Visualize updated node positions:
          %plot(pos(:,1),pos(:,2),'o','MarkerEdgeColor','b','MarkerFaceColor','b')
          %axis([0 300 0 200])
          %hold on

          % Compute the node pairs with direct connections:
          L= ConnectedList(N,pos,W);
          % Compute the no. of connected node pairs of time instant iter:
          results(iter)= AverageConnectedNodePairs(N,L);
          % Update node coordinates and speed values:
          [pos,vel]= UpdateCoordinates(pos,vel,delta);

          pause(0.001)
        end
        sprintf(string('======================================'));
        N
        FinalResult = mean(results)


        N=N+10;
    end

    results(
    
end



% Compute the final result:
FinalResult = mean(results)
