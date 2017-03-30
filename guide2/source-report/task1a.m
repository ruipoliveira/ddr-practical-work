p = [0 1 2];    % probability of 0, 1 and 2 errors
B = 800;        % packet size of 100 bytes

error_rates = [ 10^-7 10^-6 10^-5];

results = [];
format long

for i=0:1
    for j=1:3
        results(i+1,j) = binopdf(i, B, error_rates(j));
    end
end

results(3,:) = 1 - results(1,:) - results(2,:);

results
results = [];