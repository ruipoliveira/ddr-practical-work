%bionomial random variable

n = 1;      % nr de ensaios
q = 10^-7;  % probabilidade de sucesso
brv = binornd(n,q)


% geometric random variable
p = 0.01;
grv = geornd(0.01)



% 1a) Determine the probability of a data packet of total size B = 100 bytes
% being received without errors, with exactly 1 error and with 2 or more
% errors. Fulfil the following table:

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
% 2b)

for j=1:3
    results(j) = 1;
    for k=0:1
        results(j) = results(j) - (0.90 * binopdf(k, 1500*8, error_rates(j))) + (0.10 * binopdf(k, 64*8, error_rates(j)));
    end
end


results
