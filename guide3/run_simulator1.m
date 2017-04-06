	
M = 2;
C_all = [10 10 10 10 100 100 100 100 1000 1000 1000 1000];
lambda_all = [1.0 1.0 1.5 1.5 25 25 30 30 300 300 350 350];
minutes_all = [90 95 90 95 90 95 90 95 90 95 90 95];  

R = 10000; 

N = 20;

result_b = zeros(1,N);
result_o = zeros(1,N);


format short; 
for it= 1:N

	for i= 1:size(C_all,2)
		[b o] = simulator1(lambda_all(i), minutes_all(i), C_all(i), M ,R ); 
		result_b(i) = b*100; 
		result_o(i) = o; 
	end 
end


alfa= 0.1; %intervalo de confiança a 90%
media = mean(result_b);
termo = norminv(1-alfa/2)*sqrt(var(result_b)/N);
fprintf('resultado = %.2e +- %.2e\n',media,termo)








