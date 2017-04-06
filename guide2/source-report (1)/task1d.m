for j=1:3
    results(j) = (0.90 * (1- binopdf(0, 1500*8 -28*8, error_rates(j)))) + (0.10 * (1- binopdf(0, 64*8 - 28*8, error_rates(j))));
end
fprintf('1d, rep 1b')
results
results = [];

p = 0.02;

for j=1:3
    results(j) = 0;
    for i=0:1000
        n = (64-28 +i)* 8;
        geo_value = p*(1-p).^i;
        results(j) = results(j) +  (1-binopdf(0,n, error_rates(j))) * geo_value;
    end
end
fprintf('1d, rep 1c')
results
results=[];