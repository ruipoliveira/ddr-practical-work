function o = AverageConnectedNodePairs2( N, L, posAP )

[ap_count, ~] = size(posAP);
labels = [zeros(1,N) ones(1,ap_count)];
repetir = true;
[lines, ~] = size(L);
o = 0;

while repetir
    repetir = false;
    for i=1:lines
        indice1 = labels(1,L(i,1));
        indice2 = labels(1,L(i,2));
        if (indice1 ~= indice2)
            labels(1,L(i,1)) = 1;
            labels(1,L(i,2)) = 1;
            repetir = true;
        end
    end
end

o = sum(labels(1:N));
o = o / N;

end