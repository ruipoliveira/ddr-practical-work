%% alinea 2.2 a)
function ex2_2a(M, C_all, lambda_all, minutes_all)

nr_runs = 10; % nr de simulacoes
R=10000;

[b, o] = simulator1_wrapper(M, C_all, lambda_all, minutes_all, R, nr_runs);

b_confidence = zeros(size(C_all,2),2);
o_confidence = zeros(size(C_all,2),2);

% print results
for i=1:size(C_all,2)
    [b_confidence(i,1), b_confidence(i,2)] = confidence_level(0.1,b(i,:),N);
    [o_confidence(i,1), o_confidence(i,2)] = confidence_level(0.1,o(i,:),N);
    fprintf('Case %c = %.2e +- %.2e || ',char(i+64), b_confidence(i,1), b_confidence(i,2))
    fprintf('%.2e +- %.2e\n',o_confidence(i,1), o_confidence(i,2))
end

end

M = 2;
C_all = [10 10 10 10 100 100 100 100 1000 1000 1000 1000];
lambda_all = [1.0 1.0 1.5 1.5 25 25 30 30 300 300 350 350];
minutes_all = [90 95 90 95 90 95 90 95 90 95 90 95];

ex2_2a(M, C_all, lambda_all, minutes_all);
