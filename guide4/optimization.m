pairs
npairs = size(pairs, 1); 
b = randperm(pairs)
% escolher ordem random para os pares de nós
for i = 1: npairs
	aux (i,:) = pairs(b(i), :); 
end
pairs = aux; 