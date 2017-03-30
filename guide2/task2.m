%2a) For each value of p, determine the probability of the link being in the interference state
%and in the normal state when one control frame is received with errors (fulfil the
%following table). What do you conclude?

pAll = [99, 99.9, 99.99, 99.999]; 

pEF1 = 0;
pEF2 = 0;
pF1 = 0; 
pF2 = 0; 


pF1E = (pEF1*pF1) / (pEF1*pF1 + pEF2*pF2)


