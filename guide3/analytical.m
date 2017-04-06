
%verificado pelo professor
M = 2;
C_all = [10 10 10 10 100 100 100 100 1000 1000 1000 1000];
lambda_all = [1.0 1.0 1.5 1.5 25 25 30 30 300 300 350 350];
minutes_all = [90 95 90 95 90 95 90 95 90 95 90 95];  
result = []; 
%format shorte; 
format short; 
for i= 1:size(C_all,2)
	ro = (lambda_all(i)/60) * minutes_all(i); 
	N = floor(C_all(i)/M); 
	result(i,1) = blocking_probability(N, ro) * 100;
	result(i,2) = average_connection_load(N, ro) * M ; % ocupacao media em mbps e necessario multiplicar por M 
end

result	

