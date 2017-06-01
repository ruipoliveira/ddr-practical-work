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


end