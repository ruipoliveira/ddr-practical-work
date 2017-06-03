% lowest maximum connection load

n = [ 3 10 30 300];

for q=1:length(n)
    GlobalBest= Inf;
    Iterations = n(q);
    for iter=1:Iterations
        
        CurrentSolution= GreedyRandomizedLoad();
        CurrentObjective= EvaluateLoad(CurrentSolution);
        
        repeat= true;
        while repeat
            NeighbourBest= Inf;
            
            % evaluate the best neighbour
            for i=1:size(CurrentSolution,1)
                NeighbourSolution= BuildNeighbourLoad(CurrentSolution,i);
                NeighbourObjective= EvaluateLoad(NeighbourSolution);
                if NeighbourObjective < NeighbourBest
                    NeighbourBest= NeighbourObjective;
                    NeighbourBestSolution= NeighbourSolution;
                end
            end
            
            % evalute if the current is better that the best solution so far
            if NeighbourBest < CurrentObjective
                CurrentObjective= NeighbourBest;
                CurrentSolution= NeighbourBestSolution;
            else
                repeat= false;
            end
        end
        
        % evaluate the current objective against the global best
        if CurrentObjective < GlobalBest
            GlobalBestSolution= CurrentSolution;
            GlobalBest= CurrentObjective;
        end
    end
    fprintf('Iterations: %d\t GlobalBest: %0.8f\n', Iterations, GlobalBest);
end