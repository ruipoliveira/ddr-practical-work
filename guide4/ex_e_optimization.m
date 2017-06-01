<<<<<<< Updated upstream:guide4/ex_e_optimization.m
Matrizes;
miu= R*1e9/(8*1000);            % capacidade em bits / pacotes de 1000bytes -> pacotes/sec
NumberLinks= sum(sum(R>0));     % numero total de ligacoes
lambda_s= T*1e6/(8*1000);       % packet arrival rate
gama= sum(sum(lambda_s));       % trafego total na rede (packets/sec)
d= L*1e3/2e8;                   % velocidade propagacao / vel da luz na fibra optica
pairs= [];

% descobrir nos ligados por um path bidirecional
for origin=1:16
    for destination=(origin+1):17
        if T(origin,destination)+T(destination,origin)>0
            pairs= [pairs; origin destination];
        end
    end
end
npairs= size(pairs,1);
lambda= zeros(17);
routes= zeros(npairs,17);

% a.pairs
% a.routes
% a.lambda

=======
>>>>>>> Stashed changes:guide4/optimization.m
GlobalBest= Inf;
Iterations = 2; 
for iter=1:Iterations
<<<<<<< Updated upstream:guide4/ex_e_optimization.m
    CurrentSolution= GreedyRandomized();
    CurrentObjective= Evaluate(CurrentSolution);
    repeat= true;
    while repeat
        NeighbourBest= Inf;
        for i=1:size(CurrentSolution,1)
            NeighbourSolution= BuildNeighbour(CurrentSolution,i);
            NeighbourObjective= Evaluate(NeighbourSolution);
            if NeighbourObjective < NeighbourBest
                NeighbourBest= NeighbourObjective;
                NeighbourBestSolution= NeighbourSolution;
            end
        end
        if NeighbourBest < CurrentObjective
            CurrentObjective= NeighbourBest;
            CurrentSolution= NeighbourBestSolution;
        else
            repeat= false;
        end
    end
    if CurrentObjective < GlobalBest
        GlobalBestSolution= CurrentSolution;
        GlobalBest= CurrentObjective;
    end
=======
	CurrentSolution= GreedyRandomized();
	CurrentObjective= Evaluate(CurrentSolution);
	
	repeat= true;
	while repeat
		NeighbourBest= Inf;
		for i=1:size(CurrentSolution,1)
			NeighbourSolution= BuildNeighbour(CurrentSolution,i);
			NeighbourObjective= Evaluate(NeighbourSolution);
			if NeighbourObjective < NeighbourBest
				NeighbourBest= NeighbourObjective;
				NeighbourBestSolution= NeighbourSolution;
			end
		end
		if NeighbourBest < CurrentObjective
			CurrentObjective= NeighbourBest;
			CurrentSolution= NeighbourBestSolution;
		else
			repeat= false;
		end
	end
	if CurrentObjective < GlobalBest
		GlobalBestSolution= CurrentSolution;
		GlobalBest= CurrentObjective;
	end
>>>>>>> Stashed changes:guide4/optimization.m
end



<<<<<<< Updated upstream:guide4/ex_e_optimization.m
=======

>>>>>>> Stashed changes:guide4/optimization.m
