%2a) For each value of p, determine the probability of the link being in the interference state
%and in the normal state when one control frame is received with errors (fulfil the
%following table). What do you conclude?

pAll = [0.99, 0.999, 0.9999, 0.99999];

pEF1 = 0;
pEF2 = 0;
pF1 = 0;
pF2 = 0;

%pF1E = (pEF1*pF1) / (pEF1*pF1 + pEF2*pF2)

results = [];
for i=1:size(pAll,2)
    pEF1 = 0.0001;
    pEF2 = 0.5;
    pF1 = pAll(i);
    pF2 = 1-pAll(i);
    
    results(i,1) = (pEF1*pF1) / (pEF1*pF1 + pEF2*pF2);
    results(i,2) = (pEF2*pF2) / (pEF1*pF1 + pEF2*pF2);
end
results
results = [];

% 2.b. For each value of p and for n = 2, 3, 4 and 5, determine the probability of false positives
% and fulfil the follow table: 



