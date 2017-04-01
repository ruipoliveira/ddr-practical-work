results = [];
for n=2:5
    for i=1:size(pAll,2)
        pEF1 = 1- 0.0001^n;
        pEF2 = 1- 0.5^n;
        pF1 = pAll(i);
        pF2 = 1 - pAll(i);
        
        results(i,n-1) = (pEF2*pF2) / (pEF1*pF1 + pEF2*pF2);
    end
end
results
results = [];