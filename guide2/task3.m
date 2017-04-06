

states = [0 1 2 3 4];
bers = [ 10^-5 10^-4 10^-3 10^-2 10^-1];
br = [1 5 5 10]; % birthrate
dr = [100 50 50 20]; % deathrate

%old implementation
br0 = 1; 
br1 = 5;
br2 = 5; 
br3 = 10;

ded1 = 100; 
ded2 = 50; 
ded3 = 50; 
ded4 = 20; 

fprintf('task 3a \n');
format long; 
for i=1:size(states,2)
   st = states(i);
   fprintf('%d : %f \n',st,markov_func(st,br,dr)*100); 
end


%old implementation
P0 =  1 / (1 + (br0/ded1) + ((br0*br1)/(ded1*ded2)) + ((br0*br1*br2)/(ded1*ded2*ded3)) + ((br0*br1*br2*br3)/(ded1*ded2*ded3*ded4)));
P0_per = P0*100

P1 = ((br0)/(ded1))* P0;
P1_per = P1*100

P2 = ((br0*br1)/(ded1*ded2))* P0;
P2_per = P2*100

P3 = ((br0*br1*br2)/(ded1*ded2*ded3))* P0;
P3_per = P3*100

P4 = ((br0*br1*br2*br3)/(ded1*ded2*ded3*ded4))* P0;
P4_per = P4*100

fprintf('task 3b \n');

biterror=0;
for i=1:size(states,2)
   st = states(i);
   biterror = biterror + markov_func(st,br,dr)*bers(i);
end

biterror

%old implementation
biterror = P0 * 10^-5 + P1 * 10^-4 + P2 * 10^-3 + P3 * 10^-2 + P4 * 10^-1 

fprintf('task 3c \n');
	
duration0 = (1/br0)*60
duration1 = (1/(br1+ded1))*60
duration2 = (1/(br2+ded2))*60
duration3 = (1/(br3+ded3))*60
duration4 = (1/ded4)*60


% task 3d

markov_func(3,[1 5 5],[100 50 50 20]) + markov_func(4,[1 5 5 10],[100 50 50 20])

