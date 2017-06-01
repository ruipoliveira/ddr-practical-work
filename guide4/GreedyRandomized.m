<<<<<<< Updated upstream
% Greedy randomized strategy:
%  We start by considering the network without any routing path
%  We determine a random order to compute the routing paths of the flows s ∈ S
%  For each flow s ∈ S, and by the previous determined order:
%     • we assign a cost to each link based on the current routed flows
%     • we execute Dijkstra’s algorithm to compute the routing path p of flow s
%     • we update the network by routing the average packet rate λs of flow s through its assigned path p
% 


% pairs
% npairs = size(pairs, 1);
% b = randperm(npairs)
% % escolher ordem random para os pares de nós
% for i = 1: npairs
%     aux (i,:) = pairs(b(i), :);
% end
% pairs = aux;


function res = GreedyRandomized()
=======
function solution = GreedyRandomized()
>>>>>>> Stashed changes

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

	b = randperm(npairs); 
	aux = []
	% escolher ordem random para os pares de nós
	for i = 1: npairs
		aux (i,:) = pairs(b(i), :); 
	end
	pairs = aux

	for i=1:npairs
	    origin= pairs(i,1);
	    destination= pairs(i,2);

	    aux = 1./(miu-lambda) + d; % M/M/1 Atraso médio no sistema Modulo 2 slides 
	    r= ShortestPathSym(aux,origin,destination);
	    
	    routes(i,:)= r;
	    j= 1;
	    while r(j)~= destination
	        lambda(r(j),r(j+1))= lambda(r(j),r(j+1)) + lambda_s(origin,destination);
	        lambda(r(j+1),r(j))= lambda(r(j+1),r(j)) + lambda_s(destination,origin);
	        j= j+1;
	    end
	end


	solution = struct('pairs', pairs, 'routes', routes, 'lambda',lambda)

end