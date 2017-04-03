states = [0 1 2 3 4];
br = [1 5 5 10]; % birthrate
dr = [100 50 50 20];% deathrate

for i=1:size(states,2)
   st = states(i);
   fprintf('%d : %d \n',st,markov_func(st,br,dr)*100);
end
