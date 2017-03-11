function o = AverageConnectedNodePairs2( N, L, posAP )
%AVERAGECONNECTEDNODEPAIRS %Computes a value ‘o’ with the no. of connected
% node pairs based on the input matrix ‘L’ of node pairs with direct 
% connections (see Section 4.1).

[ap_count, ~] = size(posAP);
labels = [zeros(1,N) ones(1,ap_count)];
repetir = true;
[lines, ~] = size(L);
o = 0;

while repetir
    for i=1:lines
        indice1 = labels(1,L(i,1));
        indice2 = labels(1,L(i,2));
        if (indice1 == 1 || indice2 == 1)
            labels(1,L(i,1)) = 1;
            labels(1,L(i,2)) = 1;
        end
    end
    repetir = false;
end

unique_labels = unique(labels);
[~, unique_labels_count] = size(unique_labels);

for i=1:unique_labels_count
    number_of_nodes = sum( labels(labels==unique_labels(1,i))==unique_labels(1,i)) ;
    o = o + (( number_of_nodes * (number_of_nodes - 1) ) / 2) ;
end

o = o / ((N*(N-1)) / 2);

end

