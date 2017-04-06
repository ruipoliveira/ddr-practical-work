
p = 0.02;

for j=1:3
    results(j) = 0;
    for i=0:1000
        n = (64 +i)* 8;
        geo_value = p*(1-p).^i;
        results(j) = results(j) + (1- binopdf(0,n, error_rates(j)) - binopdf(1,n, error_rates(j))) * geo_value;
    end
end
results
results=[];