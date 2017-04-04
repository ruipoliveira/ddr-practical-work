fprintf('task 3d \n');

%Pinterferencia = P(state3) + P(state4)
Pinterferencia = 0; 

for i=4:size(states,2)
   Pinterferencia = Pinterferencia + markov_func(states(i),br,dr); 
end

interferencia_per = Pinterferencia *100
