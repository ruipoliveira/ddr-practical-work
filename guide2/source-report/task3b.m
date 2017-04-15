states = [0 1 2 3 4];
bers = [ 10^-5 10^-4 10^-3 10^-2 10^-1];
br = [1 5 5 10]; % birthrate
dr = [100 50 50 20];% deathrate

biterror=0;
for i=1:size(states,2)
   st = states(i);
   biterror = biterror + markov_func(st,br,dr)*bers(i);
end

biterror
