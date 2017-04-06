
for j=1:3
    results(j) = 1;
    for k=0:1
        results(j) = (0.90 * (results(j) - binopdf(k, 1500*8, error_rates(j)))) + (0.10 * (results(j) -binopdf(k, 64*8, error_rates(j))));
    end
end

results
results = [];