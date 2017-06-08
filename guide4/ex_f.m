% lowest maximum connection load

n = [ 3 10 30 300 1000];

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
            for i=1:size(CurrentSolution.pairs,1) % size de um struct?
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
    fprintf('--Highest avg: %d\t Max load %0.2f\n\n',EvaluateHighestDelay(GlobalBestSolution), EvaluateLoad(GlobalBestSolution));
end