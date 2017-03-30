%bionomial random variable

n = 1;      % nr de ensaios
q = 10^-7;  % probabilidade de sucesso
brv = binornd(n,q)


% geometric random variable

grv = geornd(0.01);

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

% 1b) Consider that 10% of data packets has a total size B=64 bytes and 90% of data packets has a 
%total size B=1500 bytes. Determine the packet discard rate (i.e., the percentage of packets that are discarded) and fulfil the following table:

for j=1:3
    results(j) = 1;
    for k=0:1
        results(j) = (0.90 * (results(j) - binopdf(k, 1500*8, error_rates(j)))) + (0.10 * (results(j) -binopdf(k, 64*8, error_rates(j))));
    end
end

results
results = [];

% 1c) Consider now that the total size, in number of Bytes, of the data packets is a constant value (64 Bytes) plus a geometric random value with parameter p=0.02. Determine the
%packet discard rate on this case and fulfil the following table:

p = 0.02;
for i=0:1000
for j=1:3
    results(j) = 0;	
	n = (64 +i)* 8;
    geo_value = p*(1-p).^i; 
    results(j) = results(j) + (1- binopdf(0,n, error_rates(j))) +(1- binopdf(1,n, error_rates(j))) * geo_value;
end

end 
results


