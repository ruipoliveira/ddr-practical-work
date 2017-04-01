
pAll = [0.99, 0.999, 0.9999, 0.99999];

%pF1E = (pEF1*pF1) / (pEF1*pF1 + pEF2*pF2)

results = [];
format long

for i=1:size(pAll,2)
    pEF1 = 0.0001;
    pEF2 = 0.5;
    pF1 = pAll(i);
    pF2 = 1-pAll(i);
    
    results(i,1) = (pEF1*pF1) / (pEF1*pF1 + pEF2*pF2);
    results(i,2) = (pEF2*pF2) / (pEF1*pF1 + pEF2*pF2);
end
results